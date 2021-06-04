import 'package:flutter/cupertino.dart';
import 'package:vexana/vexana.dart';

import '../model/login/authentication_model.dart';
import '../model/login/authentication_response_model.dart';
import '../model/register/authentication_register_model.dart';
import '../model/register/authentication_register_response_model.dart';
import '../model/register/register_withCode/register_code_model.dart';
import '../model/register/register_withCode/register_code_response_model.dart';

abstract class IAuthenticationService {
  final INetworkManager manager;
  final BuildContext context;

  IAuthenticationService(this.manager, this.context);

  Future<AuthenticationResponseModel?> fetchUserControl(
      AuthenticationModel model);

  Future<AuthenticationRegisterResponseModel?> registerUserControl(
      AuthenticationRegisterModel model);

  Future<RegisterCodeResponseModel?> registerSuccessWithCodeControl(
      RegisterCode model);
}
