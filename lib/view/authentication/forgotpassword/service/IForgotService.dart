import 'package:dio/dio.dart';

abstract class IForgotService {
  final Dio dio;
  final String emailSendPath = 'forgotPassword';
  final String resetPasswordPath = 'resetPassword';

  IForgotService(this.dio);
}
