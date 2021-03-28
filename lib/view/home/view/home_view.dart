import '../../../core/init/lang/locale_keys.g.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../viewModel/home_view_model.dart';
import '../../widgets/ImageContainer/image_container.dart';
import '../../widgets/ToggleButton/toggle_button_container.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../core/extension/string_extension.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:avatars/avatars.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (HomeViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, viewModel) => Scaffold(
              body: Padding(
                padding: context.paddingLow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: context.paddingLowHorizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Avatar(
                              shape: AvatarShape.circle(context.mediumValue),
                              placeholderColors: [
                                context.colors.primaryVariant
                              ],
                              name: 'Fatih Kurçenli',
                              elevation: 10,
                              border: Border.all(
                                  color: Colors.green,
                                  width: context.lowValue * 0.35),
                              textStyle:
                                  TextStyle(fontSize: context.mediumValue),
                            ),
                            Spacer(flex: 1),
                            Expanded(
                              child: DefaultTextStyle(
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Agne',
                                ),
                                child: AnimatedTextKit(
                                  stopPauseOnTap: true,
                                  animatedTexts: [
                                    TypewriterAnimatedText('We are building',
                                        speed: Duration(milliseconds: 150),
                                        textStyle: context.textTheme.headline6
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: context
                                                    .colors.primaryVariant)),
                                    TypewriterAnimatedText('We are the best',
                                        speed: Duration(milliseconds: 150),
                                        textStyle: context.textTheme.headline6
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: context
                                                    .colors.primaryVariant)),
                                    TypewriterAnimatedText('Back TO LIFE',
                                        speed: Duration(milliseconds: 150),
                                        textStyle: context.textTheme.headline6
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: context
                                                    .colors.primaryVariant)),
                                  ],
                                  onTap: () {
                                    print('Tap Event');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            Positioned(
                              left: context.width * 0.05,
                              child: Text(
                                LocaleKeys.home_hello.tr() + '\nFatih Kurçenli',
                                style: context.textTheme.headline4.copyWith(
                                    color: context.colors.primaryVariant),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 100),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      context.mediumValue),
                                  color: context.colors.secondaryVariant
                                      .withOpacity(0.8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: context.colors.secondaryVariant
                                          .withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 10), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: context.paddingMedium,
                                  child: Row(
                                    children: [
                                      Text(
                                        LocaleKeys.home_homedescription.tr(),
                                        style: context.textTheme.headline5
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: context.lowValue * 0.2,
                              child: SvgPicture.asset(
                                  SVGImagePaths.instance.world),
                            ),
                          ],
                        )),
                    build4Container(context, viewModel),
                  ],
                ),
              ),
            ));
  }

  Expanded build4Container(BuildContext context, HomeViewModel viewModel) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                    child: ImageContainerCustom(
                  path: SVGImagePaths.instance.scanBarcode,
                  title: LocaleKeys.home_scancode.tr(),
                )),
                Expanded(
                    child: ImageContainerCustom(
                  path: SVGImagePaths.instance.profile,
                  title: LocaleKeys.home_profile.tr(),
                )),
              ],
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                    child: ImageContainerCustom(
                  onPress: () {
                    print('hello world');
                  },
                  path: SVGImagePaths.instance.heroes,
                  title: LocaleKeys.home_heroes.tr(),
                )),
                Expanded(
                    child: ImageContainerCustom(
                  path: SVGImagePaths.instance.settings,
                  title: LocaleKeys.home_settings.tr(),
                )),
              ],
            ),
          ),
          Spacer(flex: 1),
          Row(
            children: [
              Observer(builder: (_) {
                return ToggleButtonContainer(
                  callback: viewModel.changedToggle,
                  isSelected: viewModel.isSelectedToggle,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
