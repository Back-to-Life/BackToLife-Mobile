import 'INavigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

/*   @override
  Future<String> navigateToPageReturnString({String? path}) async {
    var comeData = await navigatorKey.currentState!.pushNamed(path!);
    return comeData ?? '';
  } */

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }

  Future<void> navigateWave({required Widget child, Object? data}) async {
    await navigatorKey.currentState!.push(PageRouteBuilder(
        pageBuilder: (context, animation, _) {
          return child;
        },
        opaque: false));
  }

  Future<void> pop() async {
    await navigatorKey.currentState!.maybePop();
  }
}
