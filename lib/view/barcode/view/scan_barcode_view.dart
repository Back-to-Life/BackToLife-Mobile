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
        onPageBuilder: (BuildContext context, ScanBarcodeViewModel viewModel) =>
            Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
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
                            padding:
                                EdgeInsets.only(left: context.width * 0.05),
                            child: Text(
                              "Let's recycle in\n a few steps.",
                              textAlign: TextAlign.start,
                              style: context.textTheme.headline3!.copyWith(
                                  color: context.colors.primaryVariant),
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
                          child: Stepper(
                            controlsBuilder: (BuildContext context,
                                {VoidCallback? onStepContinue,
                                VoidCallback? onStepCancel}) {
                              return Row(
                                children: <Widget>[],
                              );
                            },
                            steps: _mySteps(),
                            currentStep: _currentStep,
                            onStepTapped: (step) {
                              setState(() {
                                _currentStep = step;
                              });
                            },
                            onStepContinue: () {
                              setState(() {
                                if (_currentStep < _mySteps().length - 1) {
                                  _currentStep = _currentStep + 1;
                                } else {
                                  print('Completed, check fields.');
                                }
                              });
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
                          ),
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

  List<Step> _mySteps() {
    var _steps = <Step>[
      Step(
        title: Text(
          'Step 1',
          style: context.textTheme.headline4!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Scan recycling waste',
          style: context.textTheme.headline6,
        ),
        content: Container(
          alignment: Alignment.centerLeft,
          height: context.height * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 1),
              Expanded(
                child: Text(
                  'Scan the QR code of the \n recycling waste',
                  style: context.textTheme.subtitle1,
                ),
              ),
              Spacer(flex: 1),
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
                      onPressed: () {},
                      child: Text(
                        'SCAN',
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
      ),
      Step(
        title: Text(
          'Step 2',
          style: context.textTheme.headline4!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Scan the recycle bin',
          style: context.textTheme.headline6,
        ),
        content: Container(
          alignment: Alignment.centerLeft,
          height: context.height * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 1),
              Expanded(
                child: Text(
                  'Now scan the QR code of the\n recycling bin that matches\n the type of recycling waste',
                  style: context.textTheme.subtitle1,
                ),
              ),
              Spacer(flex: 1),
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
                      onPressed: () {},
                      child: Text(
                        'SCAN',
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
      ),
      Step(
        title: Text(
          'Step 3',
          style: context.textTheme.headline4!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Throw in recycle bin',
          style: context.textTheme.headline6,
        ),
        content: Container(
          alignment: Alignment.centerLeft,
          height: context.height * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 1),
              Expanded(
                child: Text(
                  'Now you can put your recycling waste in the box \n and your points will be loaded on your card',
                  style: context.textTheme.subtitle1,
                ),
              ),
              Spacer(flex: 1),
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
                      onPressed: () {},
                      child: Text(
                        'Complete',
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
      ),
    ];
    return _steps;
  }
}

/* 
 class ScanBarcodeView extends StatefulWidget {
  ScanBarcodeView({Key? key}) : super(key: key);

  @override
  _ScanBarcodeViewState createState() => _ScanBarcodeViewState();
}

class _ScanBarcodeViewState extends State<ScanBarcodeView> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('deneme'),
      ),
      body:
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
          title: Text('Step 1'),
          content: TextField(),
          isActive: _currentStep >= 0,
          state: _currentStep <= 0 ? StepState.editing : StepState.complete),
      Step(
        title: Text('Step 2'),
        content: TextField(),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Step 3'),
        content: TextField(),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
} */
