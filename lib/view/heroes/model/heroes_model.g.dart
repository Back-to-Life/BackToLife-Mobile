// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroesModel _$HeroesModelFromJson(Map<String, dynamic> json) {
  return HeroesModel(
    point: json['point'] as int?,
    loginDate: json['loginDate'] == null
        ? null
        : DateTime.parse(json['loginDate'] as String),
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    login: json['login'] as bool?,
    randomCode: json['randomCode'] as int?,
    heroesModelId: json['heroesModelId'] as int?,
    imageUrl: json['imageUrl'] as String?,
    v: json['v'] as int?,
  );
}

Map<String, dynamic> _$HeroesModelToJson(HeroesModel instance) =>
    <String, dynamic>{
      'point': instance.point,
      'loginDate': instance.loginDate?.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'login': instance.login,
      'randomCode': instance.randomCode,
      'heroesModelId': instance.heroesModelId,
      'v': instance.v,
      'imageUrl': instance.imageUrl,
    };
