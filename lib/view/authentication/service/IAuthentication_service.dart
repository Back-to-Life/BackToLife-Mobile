import '../model/authentication_model.dart';
import '../model/authentication_response_model.dart';
import 'authentication_service.dart';
import 'package:vexana/vexana.dart';

abstract class IAuthenticationService {
  final INetworkManager manager;

  IAuthenticationService(this.manager);
  Future<AuthenticationResponseModel> fetchUserControl(
      AuthenticationModel model);
}
