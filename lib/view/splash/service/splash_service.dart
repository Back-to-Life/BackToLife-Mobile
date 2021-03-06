import 'dart:io';

import '../../../core/init/cache/locale_manager.dart';
import '../model/date_request_model.dart';
import '../model/date_response_model.dart';
import '../model/token/token_request_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

import 'ISplash_service.dart';

class SplashService extends ISplashService {
  SplashService(Dio dio) : super(dio);

  final String _getUnicId = LocaleManager.instance.getUnicId();
  final String? _getToken = LocaleManager.instance.getToken();

  // http://localhost:5000/logins/60b3bbb9ee719429fcece0bc/increaseCounter

  @override
  Future<bool> getTokenSuccess() async {
    try {
      final response = await dio.put('$path/$_getUnicId/$pathLast',
          data: {'myRefreshToken': '$_getToken'});

      if (response.statusCode == HttpStatus.ok) {
        if (response.data is Map<String, dynamic>) {
          var responseData = TokenResponseModel.fromJson(response.data);
          if (responseData.success) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  @override
  Future<bool> putDataToday(DateRequestModel model) async {
    try {
      final response = await dio.put('$pathDate/$_getUnicId/$pathDateLast',
          data: model.toJson());

      if (response.statusCode == HttpStatus.ok) {
        if (response.data is Map<String, dynamic>) {
          var responseData = DateResponseModel.fromJson(response.data);
          if (responseData.success) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }
}
