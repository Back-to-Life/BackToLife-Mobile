import 'package:backtolife/core/init/cache/locale_manager.dart';
import 'package:backtolife/core/init/navigation/navigation_service.dart';

import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext context;

  ICoreDio coreDio = NetworkManager.instance.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
