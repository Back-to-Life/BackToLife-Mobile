// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeUserModel _$HomeUserModelFromJson(Map<String, dynamic> json) {
  return HomeUserModel(
    point: json['point'] as int?,
    loginDate: json['loginDate'] == null
        ? null
        : DateTime.parse(json['loginDate'] as String),
    name: json['name'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    login: json['login'] as bool?,
    randomCode: json['randomCode'] as int?,
    userProfileModelId: json['userProfileModelId'] as int?,
    refreshToken: json['refreshToken'] as String?,
    unicId: json['unicId'] as String?,
    imageUrl: json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$HomeUserModelToJson(HomeUserModel instance) =>
    <String, dynamic>{
      'point': instance.point,
      'loginDate': instance.loginDate?.toIso8601String(),
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'login': instance.login,
      'randomCode': instance.randomCode,
      'userProfileModelId': instance.userProfileModelId,
      'refreshToken': instance.refreshToken,
      'unicId': instance.unicId,
      'imageUrl': instance.imageUrl,
    };
