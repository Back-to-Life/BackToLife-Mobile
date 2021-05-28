import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../viewModel/scan_barcode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScanBarcodeView extends StatefulWidget {
  const ScanBarcodeView({Key? key}) : super(key: key);

  @override
  _ScanBarcodeViewState createState() => _ScanBarcodeViewState();
}

class _ScanBarcodeViewState extends State<ScanBarcodeView> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BaseView<ScanBarcodeViewModel>(
        viewModel: ScanBarcodeViewModel(),
        onModelReady: (ScanBarcodeViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context,
                ScanBarcodeViewModel _viewModel) =>
            Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: context.colors.surface),
              ),
              body: Padding(
                padding: EdgeInsets.only(top: context.mediumValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: context.mediumValue),
                            child: Text(
                              LocaleKeys.scanBarcodeView_mainName.locale,
                              textAlign: TextAlign.start,
                              style: context.textTheme.headline4!
                                  .copyWith(color: context.colors.surface),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Theme(
                        data: ThemeData(
                            accentColor: Colors.orange,
                            primarySwatch: Colors.green,
                            colorScheme:
                                ColorScheme.light(primary: Colors.orange),
                            iconTheme: theme.iconTheme.copyWith(size: 30)),
                        child: Center(
                          child: Observer(builder: (_) {
                            return Stepper(
                              controlsBuilder: (BuildContext context,
                                  {VoidCallback? onStepContinue,
                                  VoidCallback? onStepCancel}) {
                                return Row(
                                  children: <Widget>[],
                                );
                              },
                              steps: _mySteps(_viewModel),
                              currentStep: _viewModel.stepNumber,
                              onStepTapped: (step) {
                                setState(() {
                                  _currentStep = step;
                                  _viewModel.stepNumber = step;
                                });
                              },
                              onStepContinue: () {
                                switch (_viewModel.stepNumber) {
                                  case 0:
                                    setState(() {
                                      if (_viewModel.stepNumber <
                                          _mySteps(_viewModel).length - 1) {
                                        _currentStep = _currentStep + 1;
                                        _currentStep = _viewModel.stepNumber;
                                      } else {
                                        print('Completed, check fields.');
                                      }
                                    });
                                    break;
                                  case 1:
                                    setState(() {
                                      if (_viewModel.stepNumber <
                                          _mySteps(_viewModel).length - 1) {
                                        _currentStep = _currentStep + 1;
                                        _currentStep = _viewModel.stepNumber;
                                      } else {
                                        print('Completed, check fields.');
                                      }
                                    });
                                    break;
                                  case 2:
                                    setState(() {
                                      if (_viewModel.stepNumber <
                                          _mySteps(_viewModel).length - 1) {
                                        _currentStep = _currentStep + 1;
                                        _currentStep = _viewModel.stepNumber;
                                      } else {
                                        print('Completed, check fields.');
                                      }
                                    });
                                    break;
                                  default:
                                }
                              },
                              /*  onStepCancel: () {
                              setState(() {
                                if (_currentStep > 0) {
                                  _currentStep = _currentStep - 1;
                                } else {
                                  _currentStep = 0;
                                }
                              });
                            }, */
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(SVGImagePaths.instance.konfeti)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  List<Step> _mySteps(ScanBarcodeViewModel _viewModel) {
    var _steps = <Step>[
      _step1(_viewModel),
      _step2(_viewModel),
      _step3(_viewModel),
    ];
    return _steps;
  }

  Step _step3(ScanBarcodeViewModel _viewModel) {
    return Step(
      title: Text(
        LocaleKeys.scanBarcodeView_step3.locale,
        style: context.textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold, color: context.colors.surface),
      ),
      subtitle: Text(
        LocaleKeys.scanBarcodeView_step3Title.locale,
        style: context.textTheme.headline6!
            .copyWith(color: context.colors.surface),
      ),
      content: Container(
        alignment: Alignment.centerLeft,
        height: context.height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 1),
            Expanded(
              child: Text(
                LocaleKeys.scanBarcodeView_step3Description.locale,
                style: context.textTheme.subtitle1!
                    .copyWith(color: context.colors.surface),
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black87,
                        primary: context.colors.primaryVariant,
                        minimumSize:
                            Size(context.width * 0.1, context.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: context.normalBorderRadius,
                        ),
                        elevation: 10,
                        animationDuration: const Duration(seconds: 2)),
                    onPressed: () => _viewModel.isSuccessService(),
                    child: Text(
                      LocaleKeys.scanBarcodeView_step3Button.locale,
                      style: context.textTheme.headline6!
                          .copyWith(color: Colors.white),
                    )),
              ],
            ))
          ],
        ),
      ),
      isActive: _currentStep >= 2,
      state: _currentStep <= 2 ? StepState.indexed : StepState.complete,
    );
  }

  Step _step2(ScanBarcodeViewModel _viewModel) {
    return Step(
      title: Text(
        LocaleKeys.scanBarcodeView_step2.locale,
        style: context.textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold, color: context.colors.surface),
      ),
      subtitle: Text(
        LocaleKeys.scanBarcodeView_step2Title.locale,
        style: context.textTheme.headline6!
            .copyWith(color: context.colors.surface),
      ),
      content: Container(
        alignment: Alignment.centerLeft,
        height: context.height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 1),
            Expanded(
              child: Text(
                LocaleKeys.scanBarcodeView_step2Description.locale,
                style: context.textTheme.subtitle1!
                    .copyWith(color: context.colors.surface),
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black87,
                        primary: context.colors.primaryVariant,
                        minimumSize:
                            Size(context.width * 0.1, context.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: context.normalBorderRadius,
                        ),
                        elevation: 10,
                        animationDuration: const Duration(seconds: 2)),
                    onPressed: () => _viewModel.setContainerBarcodeScan(),
                    child: Text(
                      LocaleKeys.scanBarcodeView_step2Button.locale,
                      style: context.textTheme.headline6!
                          .copyWith(color: Colors.white),
                    )),
              ],
            ))
          ],
        ),
      ),
      isActive: _currentStep >= 1,
      state: _currentStep <= 1 ? StepState.indexed : StepState.complete,
    );
  }

  Step _step1(ScanBarcodeViewModel _viewModel) {
    return Step(
      title: Text(
        LocaleKeys.scanBarcodeView_step1.locale,
        style: context.textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold, color: context.colors.surface),
      ),
      subtitle: Text(
        LocaleKeys.scanBarcodeView_step1Title.locale,
        style: context.textTheme.headline6!
            .copyWith(color: context.colors.surface),
      ),
      content: Container(
        alignment: Alignment.centerLeft,
        height: context.height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                LocaleKeys.scanBarcodeView_step1Description.locale,
                style: context.textTheme.subtitle1!
                    .copyWith(color: context.colors.surface),
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black87,
                        primary: context.colors.primaryVariant,
                        minimumSize:
                            Size(context.width * 0.1, context.height * 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: context.normalBorderRadius,
                        ),
                        elevation: 10,
                        animationDuration: const Duration(seconds: 2)),
                    onPressed: () => _viewModel.setBarcodeScan(),
                    child: Text(
                      LocaleKeys.scanBarcodeView_step1Button.locale,
                      style: context.textTheme.headline6!
                          .copyWith(color: Colors.white),
                    )),
              ],
            ))
          ],
        ),
      ),
      isActive: _currentStep >= 0,
      state: _currentStep <= 0 ? StepState.indexed : StepState.complete,
    );
  }
}
