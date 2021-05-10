import 'dart:ui';

import 'package:animations/animations.dart';
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
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];

  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();
  final GlobalKey _key4 = GlobalKey();
  final GlobalKey _key5 = GlobalKey();
  final GlobalKey _key6 = GlobalKey();

  void _layout(_) {
    Future.delayed(Duration(seconds: 3));
    showTutorial();
  }

  @override
  void initState() {
    super.initState();
    initTargets();
    WidgetsBinding.instance!.addPostFrameCallback(_layout);
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
              key: _key1,
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
                  sources: [
                    // NetworkSource('https://picsum.photos/200/300')
                    GitHubSource('fatihkurcenli')
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
                Expanded(child: scanBarcode(context)),
                Expanded(child: profileView(context)),
              ],
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: heroesView(context)),
                Expanded(child: settingsView(context)),
              ],
            ),
          ),
          Spacer(flex: 1),
          Row(
            children: [
              Observer(builder: (_) {
                return ToggleButtonContainer(
                  key: _key6,
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

  AnimatedBuilder scanBarcode(BuildContext context) {
    return AnimatedBuilder(
      animation: _rightOneSlidingAnimation,
      child: OpenContainer(
        key: _key2,
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

  AnimatedBuilder profileView(BuildContext context) {
    return AnimatedBuilder(
      animation: _leftOneSlidingAnimation,
      child: OpenContainer(
        key: _key3,
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

  AnimatedBuilder heroesView(BuildContext context) {
    return AnimatedBuilder(
      animation: _rightSecondSlidingAnimation,
      child: OpenContainer(
        key: _key4,
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

  AnimatedBuilder settingsView(BuildContext context) {
    return AnimatedBuilder(
      animation: _leftSecondSlidingAnimation,
      child: OpenContainer(
        key: _key5,
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

  void initTargets() {
    targets.add(
      TargetFocus(
        identify: 'AvatarProfile',
        keyTarget: _key1,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Profil Fotorağfınız',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Profil fotoğrafınızı burdan görebilir ve profil sayafasına gidip değiştirebilirsiniz.',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'ScanBarcode',
        keyTarget: _key2,
        color: Colors.red,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Barcode Okutma',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Barcode okutun ve kontrol aşamasından geçtikten sonra puanınıza kavuşun',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Profile',
        keyTarget: _key3,
        color: Colors.red,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Profil Sayfanız',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Profil Sayfanızda Kazandığınız puanları görüntüleyebilirsiniz.',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Heroues',
        keyTarget: _key4,
        color: Colors.red,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Kahramanlar Sayfası',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Her hafta düzenlenen top listesini görüntüleyin',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'Settings',
        keyTarget: _key5,
        color: Colors.red,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Settings Sayfası',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Ayarlar sayfasından uygulama ayarlarını ve hesap ayarlarınızı yönetebilirsiniz.',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );
    targets.add(TargetFocus(
      identify: 'ThemeMode',
      keyTarget: _key6,
      color: Colors.red,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                        Lottie.asset('asset/lottie/dark-mode-first-open.json'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Açık ve Koyu Tema Modu Ayarlama',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Text(
                    'Açık ve Koyu modunu ayarlar kısmına gitmeden alt taraftan basit bir şekilde ayarlayabilirsiniz.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));
    /*   targets.add(
      TargetFocus(
        identify: 'Profile',
        keyTarget: _key3,
        color: Colors.red,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Titulo lorem ipsum',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    ); */
/* 
    targets.add(TargetFocus(
      identify: "Target 2",
      keyTarget: _key3,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Multiples contents",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )),
        TargetContent(
            align: ContentAlign.bottom,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Multiples contents",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                Container(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));
    targets.add(TargetFocus(
      identify: "Target 3",
      keyTarget: _key4,
      color: Colors.red,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      "https://flutterdevs.com/wp-content/uploads/2020/10/logog.png",
                      fit: BoxFit.contain,
                      height: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Image Load network",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.Circle,
    )); */
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: Colors.pink,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onSkip: () {
        print("skip");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
    )..show();
  }
}
