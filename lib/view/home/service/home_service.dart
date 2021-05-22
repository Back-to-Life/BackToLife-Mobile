import 'dart:io';

import 'package:dio/dio.dart';

import '../model/home_base_model/home_base_response_model.dart';
import '../model/user_response_model.dart';
import 'IHomeService.dart';

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<HomeUserModel?> getHomeProfile() async {
    try {
      final response = await dio.get('$path/609fccfac1b2200658fa4b05');
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
