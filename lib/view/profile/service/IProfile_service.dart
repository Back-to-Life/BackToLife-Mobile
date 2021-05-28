import '../model/profile_model/profile_model.dart';
import 'package:dio/dio.dart';

import '../model/profile_update_request_model.dart';

abstract class IProfileService {
  final Dio dio;
  final String path = 'users';

  IProfileService(this.dio);

  Future<bool> updateProfilePictureUrl(ImageUpdateRequestModel model);
  Future<UserProfileModel?> getDataProfile();
}
