// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCode _$RegisterCodeFromJson(Map<String, dynamic> json) {
  return RegisterCode(
    email: json['email'] as String?,
    randomCodeReq: json['randomCodeReq'] as int?,
  );
}

Map<String, dynamic> _$RegisterCodeToJson(RegisterCode instance) =>
    <String, dynamic>{
      'email': instance.email,
      'randomCodeReq': instance.randomCodeReq,
    };
