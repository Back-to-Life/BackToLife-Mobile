import 'dart:async';

import 'package:backtolife/view/splash/model/date_request_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../service/splash_service.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late SplashService _splashService;
  late final DateTime now = DateTime.now();

  @observable
  String? thisToday;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    isCheckTokenNull();
    isTheFirstOpen();
    _splashService = SplashService(dio);
    var formatter = DateFormat('dd.MM.yyyy');
    thisToday = formatter.format(now);
    _putDate();
    _tokenCheck();
  }

  @observable
  String? isHaveToken;

  @action
  Future<void> isCheckTokenNull() async {
    isHaveToken = localeManager.getToken();
  }

  Future<void> _tokenCheck() async {
    if (isHaveToken != null) {
      var _response = await _splashService.getTokenSuccess();
      if (_response) {
        await Future.delayed(Duration(seconds: 5));
        await navigation.navigateToPageClear(
            path: NavigationConstants.HOME_VIEW);
      } else {
        await Future.delayed(Duration(seconds: 5));
        await navigation.navigateToPageClear(
            path: NavigationConstants.AUTHENTICATION_VIEW);
      }
    }
  }

  void isTheFirstOpen() async {
    var firstOpen = localeManager.getOnBoradingValue();
    if (!firstOpen) {
      await Future.delayed(Duration(seconds: 5));
      await navigation.navigateToPageClear(
          path: NavigationConstants.ON_BOARDING);
    }
    if (isHaveToken == null) {
      await Future.delayed(Duration(seconds: 5));
      await navigation.navigateToPageClear(
          path: NavigationConstants.AUTHENTICATION_VIEW);
    }
  }

  Future<void> _putDate() async {
    if (isHaveToken != null) {
      var _response = await _splashService
          .putDataToday(DateRequestModel(loginDate: thisToday));
      if (!_response) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tarih Alımında Hata oluştu'),
          ),
        );
      }
    }
  }
}
