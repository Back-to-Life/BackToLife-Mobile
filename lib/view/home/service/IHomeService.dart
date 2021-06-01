import 'package:dio/dio.dart';

import '../model/user_response_model.dart';

abstract class IHomeService {
  final Dio dio;
  final String path = 'users';
  

  IHomeService(this.dio);

  Future<HomeUserModel?> getHomeProfile();
}
