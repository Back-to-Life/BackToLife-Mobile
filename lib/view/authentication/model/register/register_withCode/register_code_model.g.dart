// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCode _$RegisterCodeFromJson(Map<String, dynamic> json) {
  return RegisterCode(
    name: json['name'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    randomCodeReq: json['randomCodeReq'] as int?,
  );
}

Map<String, dynamic> _$RegisterCodeToJson(RegisterCode instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'randomCodeReq': instance.randomCodeReq,
    };
