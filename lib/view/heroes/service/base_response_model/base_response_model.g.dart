// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseHeroes _$BaseResponseHeroesFromJson(Map<String, dynamic> json) {
  return BaseResponseHeroes(
    data: json['data'] == null
        ? null
        : HeroesModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BaseResponseHeroesToJson(BaseResponseHeroes instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
