import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

import '../model/email_toke_model/email_token_request_model.dart';
import 'IForgotService.dart';

class ForgotService extends IForgotService {
  ForgotService(Dio dio) : super(dio);

  Future<dynamic> emailSend(String email) async {
    try {
      final response = await dio.post('$emailSendPath', data: {'email': email});
      if (response.statusCode == HttpStatus.ok) {
        if (response.data['success']) {
          return true;
        } else {
          return false;
        }
      }
    } on DioError catch (e) {
      // print(e.message);
      return e.response!.data['message'].toString();
    }
  }

  Future<dynamic> emailTokenPassword(EmailTokenRequestModel model) async {
    try {
      final response =
          await dio.put('$resetPasswordPath', data: model.toJson());
      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        if (response.data['success']) {
          return true;
        } else {
          return false;
        }
      }
    } on DioError catch (e) {
      // print(e.message);
      print(e.response!.data['message'].toString());
      return e.response!.data['message'].toString();
    }
  }
}
