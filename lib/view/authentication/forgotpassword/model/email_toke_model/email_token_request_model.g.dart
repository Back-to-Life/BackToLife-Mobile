// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailTokenRequestModel _$EmailTokenRequestModelFromJson(
    Map<String, dynamic> json) {
  return EmailTokenRequestModel(
    email: json['email'] as String,
    forgotCode: json['forgotCode'] as int,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$EmailTokenRequestModelToJson(
        EmailTokenRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'forgotCode': instance.forgotCode,
      'password': instance.password,
    };
