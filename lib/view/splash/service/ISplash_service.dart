import '../model/date_request_model.dart';
import 'package:dio/dio.dart';

abstract class ISplashService {
  final Dio dio;
  final String path = 'users';
  final String pathDate = 'logins';
  final String pathLast = 'checkToken';
  final String pathDateLast = 'increaseCounter';

  ISplashService(this.dio);

  Future<bool> getTokenSuccess();
  Future<bool> putDataToday(DateRequestModel model);
}
