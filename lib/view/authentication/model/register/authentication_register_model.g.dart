// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRegisterModel _$AuthenticationRegisterModelFromJson(
    Map<String, dynamic> json) {
  return AuthenticationRegisterModel(
    name: json['name'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$AuthenticationRegisterModelToJson(
        AuthenticationRegisterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
