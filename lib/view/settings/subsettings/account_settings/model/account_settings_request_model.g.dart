// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_settings_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSettingsModel _$AccountSettingsModelFromJson(Map<String, dynamic> json) {
  return AccountSettingsModel(
    name: json['name'] as String?,
    email: json['email'] as String?,
  );
}

Map<String, dynamic> _$AccountSettingsModelToJson(
        AccountSettingsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };
