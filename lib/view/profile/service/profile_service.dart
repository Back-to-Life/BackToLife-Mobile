import 'dart:io';

import '../model/profile_base_response/profile_base_response_model.dart';
import '../model/profile_model/profile_model.dart';
import '../model/profile_update_request_model.dart';
import '../model/profile_update_response_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

import 'IProfile_service.dart';

class ProfileService extends IProfileService {
  ProfileService(Dio dio) : super(dio);

  @override
  Future<bool> updateProfilePictureUrl(ImageUpdateRequestModel model) async {
    try {
      final response = await dio.put('$path/609fccfac1b2200658fa4b05/updateUrl',
          data: model.toJson());
      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        var responseData = ImageUpdateResponseModel.fromJson(response.data);
        if (responseData.success) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      return false;
      //throw Exception(e.message);
    }
  }

  @override
  Future<UserProfileModel?> getDataProfile() async {
    try {
      final response = await dio.get('$path/609fccfac1b2200658fa4b05');
      if (response.statusCode == HttpStatus.ok) {
        if (response.data is Map<String, dynamic>) {
          final profileBaseResponse =
              ProfileBaseResponseModel.fromJson(response.data);
          return profileBaseResponse.data;
        } else {
          return null;
        }
      }
    } on DioError catch (e) {
      print(e.message);
      //throw Exception(e.message);
    }
  }
}
