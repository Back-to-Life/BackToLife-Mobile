// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileBaseResponseModel _$ProfileBaseResponseModelFromJson(
    Map<String, dynamic> json) {
  return ProfileBaseResponseModel(
    json['success'] as bool,
    UserProfileModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileBaseResponseModelToJson(
        ProfileBaseResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
