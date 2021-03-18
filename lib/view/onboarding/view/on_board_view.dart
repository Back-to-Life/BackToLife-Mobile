import 'package:auto_size_text/auto_size_text.dart';
import 'package:backtolife/core/base/view/base_view.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/init/svgPath/image_path_svg.dart';
import 'package:backtolife/view/onboarding/viewModel/on_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: SvgPicture.asset(SVGImagePaths.instance.onboarding1),
                )),
            Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.onSecondary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.primaryVariant,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(flex: 1),
                          Text("Scan The QR Code",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  color: context.theme.colorScheme.surface)),
                          Spacer(flex: 2),
                          Padding(
                            padding: context.paddingLowHorizontal,
                            child: AutoSizeText(
                                "You can easy find this application and use it.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: context.theme.colorScheme.surface)),
                          ),
                          Spacer(flex: 1),
                          Padding(
                            padding: context.paddingMedium,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [buildContainerDot(1, context)]),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  onPressed: () {},
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Next  "),
                                        SvgPicture.asset(
                                            SVGImagePaths.instance.arrowRight,
                                            width: context.width * 0.05)
                                      ]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

AnimatedContainer buildContainerDot(int index, BuildContext context) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    height: 23,
    width: 1 == index ? 30 : 23,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: 1 == index
            ? context.theme.colorScheme.primary
            : context.theme.colorScheme.onSurface),
  );
}
