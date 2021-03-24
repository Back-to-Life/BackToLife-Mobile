import 'package:backtolife/view/authentication/model/register/authentication_register_model.dart';
import 'package:backtolife/view/authentication/model/register/authentication_register_response_model.dart';

import '../model/login/authentication_model.dart';
import '../model/login/authentication_response_model.dart';

import 'package:vexana/vexana.dart';

abstract class IAuthenticationService {
  final INetworkManager manager;

  IAuthenticationService(this.manager);
  Future<AuthenticationResponseModel> fetchUserControl(
      AuthenticationModel model);

  Future<AuthenticationRegisterResponseModel> registerUserControl(
      AuthenticationRegisterModel model);
}
