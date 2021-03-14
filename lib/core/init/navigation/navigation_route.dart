import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../view/home/view/home_view.dart';
import '../../components/404/navigation_not_found.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        return simpleNavigate(HomeView());
        break;
      default:
        return MaterialPageRoute(builder: (context) => NotFoundNavigation());
    }
  }

  MaterialPageRoute simpleNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
