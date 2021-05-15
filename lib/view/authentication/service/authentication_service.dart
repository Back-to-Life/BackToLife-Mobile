import 'package:backtolife/view/authentication/model/register/register_withCode/register_code_response_model.dart';

import 'package:backtolife/view/authentication/model/register/register_withCode/register_code_model.dart';

import '../model/register/authentication_register_response_model.dart';
import '../model/register/authentication_register_model.dart';
import 'package:vexana/vexana.dart';

import '../model/login/authentication_model.dart';
import '../model/login/authentication_response_model.dart';
import 'IAuthentication_service.dart';

class AuthenticationService extends IAuthenticationService {
  AuthenticationService(INetworkManager manager) : super(manager);

  @override
  Future<AuthenticationResponseModel?> fetchUserControl(
      AuthenticationModel model) async {
    try {
      final response = await manager
          .send<AuthenticationResponseModel, AuthenticationResponseModel>(
              'login',
              parseModel: AuthenticationResponseModel(),
              method: RequestType.POST,
              data: model);
      if (response.data is AuthenticationResponseModel) {
        return response.data;
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<AuthenticationRegisterResponseModel?> registerUserControl(
      AuthenticationRegisterModel model) async {
    final response = await manager.send<AuthenticationRegisterResponseModel,
            AuthenticationRegisterResponseModel>('signup',
        parseModel: AuthenticationRegisterResponseModel(),
        method: RequestType.POST,
        data: model);

    if (response.data is AuthenticationRegisterResponseModel) {
      return response.data;
    } else {
      return null;
    }
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
