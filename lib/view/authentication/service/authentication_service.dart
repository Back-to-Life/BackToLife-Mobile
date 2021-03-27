import '../model/register/authentication_register_response_model.dart';
import '../model/register/authentication_register_model.dart';
import 'package:vexana/vexana.dart';

import '../model/login/authentication_model.dart';
import '../model/login/authentication_response_model.dart';
import 'IAuthentication_service.dart';

class AuthenticationService extends IAuthenticationService {
  AuthenticationService(INetworkManager manager) : super(manager);

  @override
  Future<AuthenticationResponseModel> fetchUserControl(
      AuthenticationModel model) async {
    final response = await manager
        .fetch<AuthenticationResponseModel, AuthenticationResponseModel>(
            'login',
            parseModel: AuthenticationResponseModel(),
            method: RequestType.POST,
            data: model);

    if (response.data is AuthenticationResponseModel) {
      return response.data;
    } else {
      return null; //if something getting error we have to fix this null option on view data !!
    }
  }

  @override
  Future<AuthenticationRegisterResponseModel> registerUserControl(
      AuthenticationRegisterModel model) async {
    final response = await manager.fetch<AuthenticationRegisterResponseModel,
            AuthenticationRegisterResponseModel>('register',
        parseModel: AuthenticationRegisterResponseModel(),
        method: RequestType.POST,
        data: model);

    if (response.data is AuthenticationRegisterResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
