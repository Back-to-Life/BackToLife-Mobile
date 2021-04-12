// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRegisterResponseModel
    _$AuthenticationRegisterResponseModelFromJson(Map<String, dynamic> json) {
  return AuthenticationRegisterResponseModel(
    success: json['success'] as bool?,
    token: json['token'] as String?,
    unicId: json['unicId'] as String?,
  );
}

Map<String, dynamic> _$AuthenticationRegisterResponseModelToJson(
        AuthenticationRegisterResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
      'unicId': instance.unicId,
    };
