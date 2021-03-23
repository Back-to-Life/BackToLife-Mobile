import 'package:vexana/vexana.dart';

import '../model/authentication_model.dart';
import '../model/authentication_response_model.dart';
import 'IAuthentication_service.dart';

class AuthenticationService extends IAuthenticationService {
  AuthenticationService(INetworkManager manager) : super(manager);

  @override
  Future<AuthenticationResponseModel> fetchUserControl(
      AuthenticationModel model) async {
    final response = await manager
        .fetch<AuthenticationResponseModel, AuthenticationResponseModel>(
            "login",
            parseModel: AuthenticationResponseModel(),
            method: RequestType.POST,
            data: model);

    if (response.data is AuthenticationResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
