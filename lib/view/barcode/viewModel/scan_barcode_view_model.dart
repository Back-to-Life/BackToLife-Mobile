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

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    scanService = ScanService(dio);
  }

  @action
  Future<void> setBarcodeScan() async {
    // ignore: omit_local_variable_types
/*     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', false, ScanMode.QR); */

    barcodeScan = 'Paper';
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
/*     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', false, ScanMode.QR); */

    containerQr = 'Paper';
    print(containerQr);
    if (containerQr == '-1') {
      await scanBarcodeDialog();
    } else {
      stepNumber += 1;
      containerQr = containerQr; //fonksiyondan gelen değerle eşitle
    }
  }

  @action
  Future<void> completePointServiceCall() async {
    if (barcodeScan == containerQr) {
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
    } else {
      await isNotSameName();
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
}
