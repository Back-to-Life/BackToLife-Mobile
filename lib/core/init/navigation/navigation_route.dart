import '../../../view/heroes/view/heroes_view.dart';

import '../../../view/settings/subsettings/notifications_settings/view/notifications_view.dart';
import '../../../view/settings/subsettings/permissions_settings/view/permissions_settings_view.dart';
import '../../../view/settings/subsettings/theme_mode_settings/view/theme_settings_view.dart';
import '../../../view/settings/view/settings_view.dart';

import '../../../view/settings/subsettings/language_settings/view/language_settings_view.dart';

import '../../../view/barcode/view/scan_barcode_view.dart';

import '../../../view/authentication/view/authentication_view.dart';
import '../../../view/profile/view/profile_view.dart';

import '../../../view/onboarding/view/on_board_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../view/home/view/home_view.dart';
import '../../components/404/navigation_not_found.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.ON_BOARDING:
        return simpleNavigate(OnBoardView());
      case NavigationConstants.AUTHENTICATION_VIEW:
        return simpleNavigate(AuthenticationView());
      case NavigationConstants.HOME_VIEW:
        return simpleNavigate(HomeView());
      case NavigationConstants.PROFILE:
        return simpleNavigate(ProfileView());
      case NavigationConstants.QRCODE:
        return simpleNavigate(ScanBarcodeView());
      case NavigationConstants.SETTINGS:
        return simpleNavigate(SettingsView());
      case NavigationConstants.LANGUAGE_SETTINGS:
        return simpleNavigate(LanguageSettingsView());
      case NavigationConstants.NOTIFICATION_SETTINGS:
        return simpleNavigate(NotificationsSettingsView());
      case NavigationConstants.PERMISSIONS_SETTINGS:
        return simpleNavigate(PermissionsSettingView());
      case NavigationConstants.THEMEMODE_SETTINGS:
        return simpleNavigate(ThemeSettingsView());
      case NavigationConstants.ABOUT_SETTINGS:
        return simpleNavigate(LanguageSettingsView());
      case NavigationConstants.LOGOUT_SETTINGS:
        return simpleNavigate(LanguageSettingsView());
      case NavigationConstants.HEROES:
        return simpleNavigate(HeroesView());

      default:
        return MaterialPageRoute(builder: (context) => NotFoundNavigation());
    }
  }

  MaterialPageRoute simpleNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
