// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponseModel _$AuthenticationResponseModelFromJson(
    Map<String, dynamic> json) {
  return AuthenticationResponseModel(
    success: json['success'] as bool?,
    token: json['token'] as String?,
    id: json['id'] as String?,
  );
}

Map<String, dynamic> _$AuthenticationResponseModelToJson(
        AuthenticationResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
      'id': instance.id,
    };
