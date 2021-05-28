import '../model/user_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enum/app_theme_enum.dart';
import '../../../core/constants/enum/locale_keys_enum.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../profile/view/profile_view.dart';
import '../service/home_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late TutorialCoachMark tutorialCoachMark;
  late final HomeService homeService;
  late HomeUserModel homeUserModel;
  @observable
  List<TargetFocus> targets = [];
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();
  GlobalKey key4 = GlobalKey();
  GlobalKey key5 = GlobalKey();
  GlobalKey key6 = GlobalKey();

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    homeService = HomeService(dio);
    getHomeUserModel();
    initTargets();
    getTutorialSuccess();
    changeToggleButtonInit();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        _layout(_);
      });
    });
    print(localeManager.getToken());
    print(localeManager.getUnicId());
  }

  @observable
  bool? _localeValue;

  @observable
  bool isSelectedToggle = false;

  @action
  void changedToggle() {
    isSelectedToggle = !isSelectedToggle;
    if (isSelectedToggle == true) {
      Provider.of<ThemeNotifier>(context, listen: false)
          .changeValue(AppThemes.DARK);
    } else if (isSelectedToggle == false) {
      Provider.of<ThemeNotifier>(context, listen: false)
          .changeValue(AppThemes.LIGHT);
    }
  }

  @observable
  bool isLoading = false;
  @observable
  bool isLoadingProfileImage = false;
  @observable
  int number = 0;

  @action
  void increment() {
    number++;
  }

  @action
  void changedLoading() {
    isLoadingProfileImage = !isLoadingProfileImage;
  }

  @action
  Future<void> getHomeUserModel() async {
    changedLoading();
    var responseData = await homeService.getHomeProfile();
    if (responseData != null) {
      homeUserModel = responseData;
    }
    changedLoading();
  }

  @action
  void changeToggleButtonInit() {
    var isThemeChange =
        LocaleManager.instance.getThemeManager(PreferencesKeys.THEME);
    if (isThemeChange) {
      isSelectedToggle = false;
    } else {
      isSelectedToggle = true;
    }
  }

  Future<void> goToProfile() async {
    await navigation.navigateToPage(path: NavigationConstants.PROFILE);
  }

  Future<void> goToProfileWave() async {
    await navigation.navigateWave(child: ProfileView());
  }

  Future<void> goToQrCode() async {
    await navigation.navigateToPage(path: NavigationConstants.QRCODE);
  }

  @action
  void initTargets() {
    targets.add(
      TargetFocus(
        identify: 'AvatarProfile',
        keyTarget: key1,
        color: Color(0xFF72A863),
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Profil Fotorağfınız',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Profil fotoğrafınızı burdan görebilir ve profil sayafasına gidip değiştirebilirsiniz.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Lottie.asset('asset/lottie/profile-tutorial.json'),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: 'ScanBarcode',
        keyTarget: key2,
        color: Color(0xFFC4C0FF),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Container(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(80.0),
                        child: Lottie.asset('asset/lottie/barcode-scan.json'),
                      ),
                    ),
                  ),
                  Text(
                    'Barcode Okutma',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Barcode okutun ve kontrol aşamasından geçtikten sonra puanınıza kavuşun',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                  ),
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
        keyTarget: key3,
        color: Color(0xFFC4C0FF),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child:
                        Lottie.asset('asset/lottie/profile-user-tutorial.json'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Profil Sayfanız',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Profil Sayfanızda Kazandığınız puanları görüntüleyebilirsiniz.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ),
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
        keyTarget: key4,
        color: Color(0xFFC4C0FF),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Lottie.asset('asset/lottie/hero-tutorial.json'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Kahramanlar Sayfası',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4E5F49),
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Her hafta düzenlenen top listesini görüntüleyin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: Color(0xFF4E5F49),
                      ),
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
        keyTarget: key5,
        color: Color(0xFFC4C0FF),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Lottie.asset('asset/lottie/settings-tutorial.json'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Settings Sayfası',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4E5F49),
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Ayarlar sayfasından uygulama ayarlarını ve hesap ayarlarınızı yönetebilirsiniz.',
                      style: TextStyle(
                          color: Color(0xFF4E5F49),
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0),
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
      keyTarget: key6,
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
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                  ),
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));
  }

  @action
  void _layout(_) {
    if (_localeValue != null) {
      if (!_localeValue!) {
        showTutorial();
      }
    }
  }

  @action
  Future<void> getTutorialSuccess() async {
    var getLocaleValue = await LocaleManager.instance.getTutorialManager();

    _localeValue = getLocaleValue;
  }

  @action
  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      textSkip: 'SKIP',
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () async {
        await LocaleManager.instance
            .setTutorialManager(PreferencesKeys.TUTORIAL, true);
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onSkip: () async {
        await LocaleManager.instance
            .setTutorialManager(PreferencesKeys.TUTORIAL, true);
      },
      onClickOverlay: (target) {
        // print('onClickOverlay: $target');
      },
    )..show();
  }
}
