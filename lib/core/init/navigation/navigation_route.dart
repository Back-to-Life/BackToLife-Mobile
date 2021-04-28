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

      default:
        return MaterialPageRoute(builder: (context) => NotFoundNavigation());
    }
  }

  MaterialPageRoute simpleNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
  
}
