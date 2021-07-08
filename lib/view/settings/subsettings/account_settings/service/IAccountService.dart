import '../model/account_settings_request_model.dart';
import 'package:dio/dio.dart';

abstract class IAccountService {
  final Dio dio;
  final String path = 'accountSettings';

  IAccountService(this.dio);

  Future<bool> changeNameAndEmail(AccountSettingsModel accountSettingsModel);
}
