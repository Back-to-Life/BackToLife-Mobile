import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:backtolife/core/constants/enum/locale_keys_enum.dart';
import 'package:backtolife/core/init/cache/locale_manager.dart';
import 'package:backtolife/view/heroes/view/heroes_view.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../../settings/view/settings_view.dart';
import '../../barcode/view/scan_barcode_view.dart';
import '../../profile/view/profile_view.dart';

import '../../widgets/star/star_background.dart';

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

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late Animation _worldAnimation;
  late Animation _leftOneSlidingAnimation;
  late Animation _leftSecondSlidingAnimation;
  late Animation _rightOneSlidingAnimation;
  late Animation _rightSecondSlidingAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    _worldAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1, curve: Curves.fastOutSlowIn)));

    _leftOneSlidingAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.25, 1, curve: Curves.fastOutSlowIn)));
    _leftSecondSlidingAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5, 1, curve: Curves.fastOutSlowIn)));
    _rightOneSlidingAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.25, 1, curve: Curves.fastOutSlowIn)));

    _rightSecondSlidingAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5, 1, curve: Curves.fastOutSlowIn)));

    _animationController.forward();
   /*  WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        _layout(_);
      });
    }); */
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
                      child: _profileAvatar(context, viewModel),
                    ),
                    Expanded(flex: 3, child: helloName(context)),
                    build4Container(context, viewModel),
                  ],
                ),
              ),
            ));
  }

  Padding _profileAvatar(BuildContext context, HomeViewModel _viewModel) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OpenContainer(
              key: _viewModel.key1,
              transitionType: ContainerTransitionType.fade,
              transitionDuration: Duration(seconds: 3),
              closedColor: context.colors.primary,
              closedElevation: 0,
              closedShape: CircleBorder(),
              openBuilder: (context, _) => ProfileView(),
              closedBuilder: (context, VoidCallback openContainer) => Avatar(
                  shape: AvatarShape.circle(context.mediumValue),
                  placeholderColors: [context.colors.primaryVariant],
                  name: 'Fatih Kurçenli',
                  elevation: 10,
                  // onTap: showTutorial,
                  sources: [
                    // NetworkSource(
                    // 'https://firebasestorage.googleapis.com/v0/b/backtolife-recycling.appspot.com/o/A-binary-input-image-size-40X40-px.png?alt=media&token=0173d664-fa76-46d1-bf70-574584c01284')
                    GitHubSource('fatihkurcenli'),
                  ],
                  loader: Shimmer.fromColors(
                      child: CircleAvatar(radius: context.mediumValue),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!),
                  border: Border.all(
                      color: Colors.green, width: context.lowValue * 0.35),
                  textStyle: TextStyle(fontSize: context.mediumValue))),
          Spacer(flex: 1),
          Expanded(
            child: DefaultTextStyle(
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 30.0, fontFamily: 'Agne'),
              child: AnimatedTextKit(
                stopPauseOnTap: true,
                animatedTexts: [
                  TypewriterAnimatedText('We are building',
                      speed: Duration(milliseconds: 150),
                      textStyle: context.textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.surface)),
                  TypewriterAnimatedText('We are the best',
                      speed: Duration(milliseconds: 150),
                      textStyle: context.textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.surface)),
                  TypewriterAnimatedText('Back TO LIFE',
                      speed: Duration(milliseconds: 150),
                      textStyle: context.textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.surface)),
                ],
                onTap: () {
                  print('Tap Event');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack helloName(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: context.width * 0.05,
          child: AnimatedBuilder(
            animation: _worldAnimation,
            builder: (BuildContext context, Widget? child) {
              return Transform(
                transform: Matrix4.translationValues(
                    0, _rightSecondSlidingAnimation.value * context.height, 0),
                child: Text(
                  LocaleKeys.home_hello.tr() + '\nFatih Kurçenli',
                  style: context.textTheme.headline4!
                      .copyWith(color: context.colors.surface),
                ),
              );
            },
          ),
        ),
        buildWorldContainer(context),
        Positioned(
          right: context.lowValue * 0.2,
          child: AnimatedBuilder(
              animation: _worldAnimation,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  transform: Matrix4.translationValues(
                    _worldAnimation.value * context.width,
                    0.0,
                    0.0,
                  ),
                  child: SvgPicture.asset(SVGImagePaths.instance.world),
                );
              }),
        )
      ],
    );
  }

  Padding buildWorldContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.mediumValue),
                color: context.colors.secondaryVariant.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(
                    color: context.colors.secondaryVariant.withOpacity(0.3),
                  ),
                ],
                border: Border.all(
                    width: 1.5,
                    color: context.colors.secondaryVariant.withOpacity(0.3))),
            child: Padding(
              padding: context.paddingMedium,
              child: Row(
                children: [
                  Text(
                    LocaleKeys.home_homedescription.tr(),
                    style: context.textTheme.headline5!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded build4Container(BuildContext context, HomeViewModel _viewModel) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: scanBarcode(context, _viewModel)),
                Expanded(child: profileView(context, _viewModel)),
              ],
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: heroesView(context, _viewModel)),
                Expanded(child: settingsView(context, _viewModel)),
              ],
            ),
          ),
          Spacer(flex: 1),
          Row(
            children: [
              Observer(builder: (_) {
                return ToggleButtonContainer(
                  key: _viewModel.key6,
                  callback: _viewModel.changedToggle,
                  isSelected: _viewModel.isSelectedToggle,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  AnimatedBuilder scanBarcode(BuildContext context, HomeViewModel _viewModel) {
    return AnimatedBuilder(
      animation: _rightOneSlidingAnimation,
      child: OpenContainer(
        key: _viewModel.key2,
        transitionType: ContainerTransitionType.fade,
        transitionDuration: Duration(seconds: 3),
        closedColor: context.colors.primary,
        closedElevation: 0,
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        openBuilder: (context, _) => ScanBarcodeView(),
        closedBuilder: (context, VoidCallback openContainer) =>
            ImageContainerCustom(
          onPress: openContainer,
          path: SVGImagePaths.instance.scanBarcode,
          title: LocaleKeys.home_scancode.tr(),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform(
            transform: Matrix4.translationValues(
                _rightOneSlidingAnimation.value * context.width, 0, 0),
            child: child);
      },
    );
  }

  AnimatedBuilder profileView(BuildContext context, HomeViewModel _viewModel) {
    return AnimatedBuilder(
      animation: _leftOneSlidingAnimation,
      child: OpenContainer(
        key: _viewModel.key3,
        transitionType: ContainerTransitionType.fade,
        transitionDuration: Duration(seconds: 3),
        closedColor: context.colors.primary,
        closedElevation: 0,
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        openBuilder: (context, _) => ProfileView(),
        closedBuilder: (context, VoidCallback openContainer) =>
            ImageContainerCustom(
          onPress: openContainer,
          path: SVGImagePaths.instance.profile,
          title: LocaleKeys.home_profile.tr(),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform(
            transform: Matrix4.translationValues(
                _leftOneSlidingAnimation.value * context.width, 0, 0),
            child: child);
      },
    );
  }

  AnimatedBuilder heroesView(BuildContext context, HomeViewModel _viewModel) {
    return AnimatedBuilder(
      animation: _rightSecondSlidingAnimation,
      child: OpenContainer(
        key: _viewModel.key4,
        transitionType: ContainerTransitionType.fade,
        transitionDuration: Duration(seconds: 3),
        closedColor: context.colors.primary,
        closedElevation: 0,
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        openBuilder: (context, _) => HeroesView(), //added heroes page.
        closedBuilder: (context, VoidCallback openContainer) =>
            ImageContainerCustom(
          onPress: openContainer,
          path: SVGImagePaths.instance.heroes,
          title: LocaleKeys.home_heroes.tr(),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform(
            transform: Matrix4.translationValues(
                _rightSecondSlidingAnimation.value * context.width, 0, 0),
            child: child);
      },
    );
  }

  AnimatedBuilder settingsView(BuildContext context, HomeViewModel _viewModel) {
    return AnimatedBuilder(
      animation: _leftSecondSlidingAnimation,
      child: OpenContainer(
        key: _viewModel.key5,
        transitionType: ContainerTransitionType.fade,
        transitionDuration: Duration(seconds: 3),
        closedColor: context.colors.primary,
        closedElevation: 0,

        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        openBuilder: (context, _) => SettingsView(), //added settings page.
        closedBuilder: (context, VoidCallback openContainer) =>
            ImageContainerCustom(
          onPress: openContainer,
          path: SVGImagePaths.instance.settings,
          title: LocaleKeys.home_settings.tr(),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform(
            transform: Matrix4.translationValues(
                _leftSecondSlidingAnimation.value * context.width, 0, 0),
            child: child);
      },
    );
  }
}
