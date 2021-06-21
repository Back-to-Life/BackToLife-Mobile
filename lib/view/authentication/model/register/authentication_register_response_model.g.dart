// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRegisterResponseModel
    _$AuthenticationRegisterResponseModelFromJson(Map<String, dynamic> json) {
  return AuthenticationRegisterResponseModel(
    unicID: json['unicID'] as String?,
    rtoken: json['rtoken'] as String?,
    message: json['message'] as String?,
    register: json['register'] as bool?,
  );
}

Map<String, dynamic> _$AuthenticationRegisterResponseModelToJson(
        AuthenticationRegisterResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'register': instance.register,
      'unicID': instance.unicID,
      'rtoken': instance.rtoken,
    };
