import 'package:dio/dio.dart';

abstract class ISplashService {
  final Dio dio;
  final String path = 'users';
  final String pathLast = 'checkToken';

  ISplashService(this.dio);

  Future<bool> getTokenSuccess();
}
