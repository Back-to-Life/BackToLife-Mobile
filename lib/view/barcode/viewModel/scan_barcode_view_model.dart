import 'dart:async';

import 'package:backtolife/core/constants/navigation/navigation_constants.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/svgPath/lottie_path.dart';
import '../model/scan_request_model.dart';
import '../service/scan_service.dart';
import '../../widgets/showAlertDialog/alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:mobx/mobx.dart';

part 'scan_barcode_view_model.g.dart';

class ScanBarcodeViewModel = _ScanBarcodeViewModelBase
    with _$ScanBarcodeViewModel;

abstract class _ScanBarcodeViewModelBase with Store, BaseViewModel {
  late ScanService scanService;

  @observable
  String? barcodeScan;

  @observable
  String? containerQr;

  @observable
  bool goToContainerSuccess = false;

  @observable
  int stepNumber = 0;

  @observable
  int counter = 0;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    scanService = ScanService(dio);
  }

  @action
  Future<void> setBarcodeScan() async {
    // ignore: omit_local_variable_types
    barcodeScan = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', false, ScanMode.QR);

    print(barcodeScan);
    if (barcodeScan == '-1') {
      await scanBarcodeDialog();
    } else {
      stepNumber += 1;
      barcodeScan = barcodeScan; //fonksiyondan gelen değerle eşitle
    }
  }

  @action
  Future<void> setContainerBarcodeScan() async {
    // ignore: omit_local_variable_types
    containerQr = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', false, ScanMode.QR);

    print(containerQr);
    if (containerQr == '-1') {
      await scanBarcodeDialog();
    } else {
      if (containerQr == barcodeScan) {
        stepNumber += 1;
      } else {
        stepNumber = 0;
        barcodeScan = null;
        containerQr = null;
        await isNotSameName();
      }
    }
  }

  @action
  Future<void> completePointServiceCall() async {
    if (!goToContainerSuccess) {
      //true gelmesi lazım ancak ben şuanlık false ters yaptırıyorum..
      var responseBool = await scanService
          .fetchScanService(ScanRequestModel(pointName: '$barcodeScan'));
      if (!responseBool) {
        //eğer serviste bir hata var ise bunu show diolog ile gösteriyorum
        await showDialog(
            context: context,
            builder: (context) => CustomConfirmDialog(
                title: LocaleKeys.errorDialog_eror2.tr(),
                description: LocaleKeys.errorDialog_error2Description.tr(),
                jsonPath: LottiePaths.instance.errorLottie));
      }
    }
  }

  @action
  Future<void> scanBarcodeDialog() async {
    await showDialog(
        context: context,
        builder: (context) => CustomConfirmDialog(
            title: LocaleKeys.errorDialog_error1.tr(),
            description: LocaleKeys.errorDialog_error1Description.tr(),
            jsonPath: LottiePaths.instance.qrCodeError));
  }

  @action
  Future<void> isNotSameName() async {
    await showDialog(
        context: context,
        builder: (context) => CustomConfirmDialog(
            title: LocaleKeys.errorDialog_error3.tr(),
            description: LocaleKeys.errorDialog_error3Description.tr(),
            jsonPath: LottiePaths.instance.qrCodeError));
  }

  @action
  Future<void> isSuccessService() async {
    var responseBool = await scanService
        .fetchScanService(ScanRequestModel(pointName: '$barcodeScan'));
    if (!responseBool) {
      await showDialog(
          context: context,
          builder: (context) => CustomConfirmDialog(
              title: LocaleKeys.errorDialog_eror2.tr(),
              description: LocaleKeys.errorDialog_error2Description.tr(),
              jsonPath: LottiePaths.instance.errorLottie));
    }
  }

  @action
  void updateCounter() {
    counter++;
  }

  Stream<bool> productsStream() async* {
    while (counter < 10) {
      updateCounter();
      await Future.delayed(Duration(seconds: 6));
      yield await scanService.fetchFirebaseRealTime();
    }
  }

  @action
  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Please Wait..'),
          content: Container(
            height: context.height * 0.3,
            child: StreamBuilder<bool>(
              stream: productsStream(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                List<Widget> children;
                if (snapshot.hasError) {
                  children = [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                } else {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      children = [
                        Text('connection None'),
                      ];
                      break;
                    case ConnectionState.waiting:
                      children = [
                        Expanded(
                            flex: 6,
                            child: LottieBuilder.asset(
                                LottiePaths.instance.serviceFirebase)),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Please wait.. Your trash is being analyzed.',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ];
                      break;
                    case ConnectionState.active:
                      children = [
                        Expanded(
                            flex: 6,
                            child: LottieBuilder.asset(
                                LottiePaths.instance.serviceFirebase)),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Please wait.. Your trash is being analyzed.',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ];

                      break;
                    case ConnectionState.done:
                      children = [
                        Expanded(
                            flex: 5,
                            child: LottieBuilder.asset(
                                LottiePaths.instance.tryAgain)),
                        Spacer(),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Please try again as it has been over a minute.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: context.colors.primaryVariant,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('Okey',
                                    style: context.textTheme.headline5!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white))))
                      ];
                      break;
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!) {
                      print('başarılı bir şekilde puan eklendi');
                      completePointServiceCall();
                      counter = 10;
                      //TODO burda hata alıyorum...
                      /*      navigation.navigateToPageClear(
                          path: NavigationConstants.HOME_VIEW); */
                    } else {
                      print('burası yokustur');
                    }
                  }
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
