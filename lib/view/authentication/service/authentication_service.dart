import '../model/register/register_withCode/register_code_response_model.dart';

import '../model/register/register_withCode/register_code_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../model/register/authentication_register_response_model.dart';
import '../model/register/authentication_register_model.dart';
import 'package:vexana/vexana.dart';

import '../model/login/authentication_model.dart';
import '../model/login/authentication_response_model.dart';
import 'IAuthentication_service.dart';

class AuthenticationService extends IAuthenticationService {
  AuthenticationService(INetworkManager manager, BuildContext context)
      : super(manager, context);

  @override
  Future<AuthenticationResponseModel?> fetchUserControl(
      AuthenticationModel model) async {
    final response = await manager
        .send<AuthenticationResponseModel, AuthenticationResponseModel>('login',
            parseModel: AuthenticationResponseModel(),
            method: RequestType.POST,
            data: model);
    if (response.data is AuthenticationResponseModel) {
      return response.data;
    }
  }

  @override
  Future<AuthenticationRegisterResponseModel?> registerUserControl(
      AuthenticationRegisterModel model) async {
    try {
      final response = await manager.send<AuthenticationRegisterResponseModel,
              AuthenticationRegisterResponseModel>('signup',
          parseModel: AuthenticationRegisterResponseModel(),
          method: RequestType.POST,
          data: model);

      if (response.data is AuthenticationRegisterResponseModel) {
        return response.data;
      } else {
        print(response);
        return null;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        print('işte geliyor erorr ${e.response!.statusCode}');
      }
    }
    /*  var dio = Dio();
    
    try {
      final response =
          await dio.post('http://10.0.2.2:5000/signup', data: model);
      print(response.data);
      print(response);
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        print('işte geliyor erorr $e.response!.statusCode');
      }
      return 
    } */
  }

  @override
  Future<RegisterCodeResponseModel?> registerSuccessWithCodeControl(
      RegisterCode model) async {
    try {
      final response = await manager
          .send<RegisterCodeResponseModel, RegisterCodeResponseModel>(
              'email-activate',
              parseModel: RegisterCodeResponseModel(),
              method: RequestType.POST,
              data: model);

      if (response.data is RegisterCodeResponseModel) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception();
    }
  }
}
