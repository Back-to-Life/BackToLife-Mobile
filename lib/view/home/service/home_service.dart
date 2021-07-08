import 'dart:io';

import '../../../core/init/cache/locale_manager.dart';
import 'package:dio/dio.dart';

import '../model/home_base_model/home_base_response_model.dart';
import '../model/user_response_model.dart';
import 'IHomeService.dart';

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);
  final String getUnicId = LocaleManager.instance.getUnicId();

  @override
  Future<HomeUserModel?> getHomeProfile() async {
    try {
      final response = await dio.get('$path/$getUnicId');
      if (response.statusCode == HttpStatus.ok) {
        if (response.data is Map<String, dynamic>) {
          final profileBaseResponse =
              HomeBaseResponseModel.fromJson(response.data);
          return profileBaseResponse.data;
        } else {
          return null;
        }
      }
    } on DioError catch (e) {
      print(e.message);
      //throw Exception(e.message);
    }
  }
}
