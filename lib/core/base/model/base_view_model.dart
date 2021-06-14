import 'package:backtolife/core/constants/app/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';

abstract class BaseViewModel {
  late BuildContext context;
  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
  // final Dio dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:5000/'));
  // final Dio dio = Dio(BaseOptions(baseUrl: '${ApiConstants.instance.herokuApi}'));
  // final Dio dio = Dio(BaseOptions(baseUrl: 'http://localhost:5000/'));
  final Dio dio = Dio(
      BaseOptions(baseUrl: 'http://${ApiConstants.instance.localHost}:5000/'));

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
