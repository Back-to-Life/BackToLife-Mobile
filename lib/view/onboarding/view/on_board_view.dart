import 'package:auto_size_text/auto_size_text.dart';
import '../../widgets/Avatar/onboarding_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../viewModel/on_board_view_model.dart';

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
          Observer(builder: (_) {
        return Scaffold(
            backgroundColor: viewModel.currentIndex == 1
                ? context.colors.primaryVariant
                : context.colors.primary,
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: PageView.builder(
                    itemCount: viewModel.onBoardItems.length,
                    onPageChanged: (value) {
                      if (value != 3) {
                        viewModel.changedCurrentIndex(value);
                      }
                    },
                    itemBuilder: (context, index) => Container(
                      child: Padding(
                        padding: (viewModel.currentIndex == 2 ||
                                viewModel.currentIndex == 1)
                            ? context.paddingMedium
                            : context.paddingLow,
                        child: Center(
                          child: SvgPicture.asset(viewModel
                              .onBoardItems[viewModel.currentIndex].imagePath),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      backGroundNotChangedStack(context),
                      Observer(builder: (_) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            color: viewModel.currentIndex == 1
                                ? context.theme.colorScheme.primary
                                : context.colors.primaryVariant,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(flex: 1),
                              Expanded(
                                flex: 2,
                                child: Observer(builder: (_) {
                                  return Text(
                                      viewModel
                                          .onBoardItems[viewModel.currentIndex]
                                          .title,
                                      style: context.textTheme.headline4
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: viewModel.currentIndex == 1
                                                  ? context.theme.colorScheme
                                                      .primaryVariant
                                                  : context.colors.surface));
                                }),
                              ),
                              Expanded(
                                flex: 4,
                                child: Observer(builder: (_) {
                                  return Padding(
                                    padding: context.paddingMedium,
                                    child: Text(
                                        viewModel
                                            .onBoardItems[viewModel
                                                .currentIndex]
                                            .description,
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.subtitle1
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: viewModel.currentIndex ==
                                                        1
                                                    ? context.theme.colorScheme
                                                        .primaryVariant
                                                    : context.colors.surface)),
                                  );
                                }),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: context.paddingMediumHorizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            viewModel.onBoardItems.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return OnBoardCircle(
                                              index: viewModel.currentIndex,
                                              isSelected:
                                                  viewModel.currentIndex ==
                                                      index);
                                        },
                                      ),
                                      Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 10,
                                              offset: Offset(0, 3))
                                        ]),
                                        child: viewModel.isLoading
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        context.colors
                                                            .secondaryVariant),
                                                backgroundColor: Colors.white,
                                              )
                                            : RaisedButton(
                                                color: viewModel.currentIndex ==
                                                        1
                                                    ? context.colors.onPrimary
                                                    : context.colors.surface,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20))),
                                                onPressed: () {
                                                  if (viewModel.currentIndex !=
                                                      2) {
                                                    viewModel.changedCurrentIndex(
                                                        viewModel.currentIndex +
                                                            1);
                                                  } else {
                                                    viewModel
                                                        .completeToOnBoard();
                                                  }
                                                },
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      viewModel.currentIndex ==
                                                              2
                                                          ? Text("Done   ")
                                                          : Text("Next  "),
                                                      SvgPicture.asset(
                                                          SVGImagePaths.instance
                                                              .arrowRight,
                                                          width: context.width *
                                                              0.05)
                                                    ]),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(flex: 1),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            ));
      }),
    );
  }

  Container backGroundNotChangedStack(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.onSecondary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
    );
  }
}
