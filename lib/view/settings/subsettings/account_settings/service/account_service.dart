import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../core/init/cache/locale_manager.dart';
import '../model/account_settings_request_model.dart';
import 'IAccountService.dart';

class AccountSettingsService extends IAccountService {
  AccountSettingsService(Dio dio) : super(dio);
  final String getUnicId = LocaleManager.instance.getUnicId();

  @override
  Future<bool> changeNameAndEmail(
      AccountSettingsModel accountSettingsModel) async {
    if (accountSettingsModel.email == null) {
      try {
        final response = await dio
            .put('$getUnicId/$path', data: {'name': accountSettingsModel.name});
        if (response.statusCode == HttpStatus.ok) {
          print(response.data['success']);
          if (response.data['success']) {
            return true;
          }
        } else {
          return false;
        }
      } on DioError catch (e) {
        print(e.message);
        return false;
      }
    } else if (accountSettingsModel.name == null) {
      try {
        final response = await dio.put('$getUnicId/$path',
            data: {'email': accountSettingsModel.email});
        if (response.statusCode == HttpStatus.ok) {
          print(response.data['success']);
          if (response.data['success']) {
            return true;
          }
        } else {
          return false;
        }
      } on DioError catch (e) {
        print(e.message);
        return false;
      }
    } else {
      try {
        final response = await dio.put('$getUnicId/$path',
            data: accountSettingsModel.toJson());
        if (response.statusCode == HttpStatus.ok) {
          print(response.data['success']);
          if (response.data['success']) {
            return true;
          }
        } else {
          return false;
        }
      } on DioError catch (e) {
        print(e.message);
        return false;
      }
    }
    return false;
  }
}
