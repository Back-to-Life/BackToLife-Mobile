// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseHeroes _$BaseResponseHeroesFromJson(Map<String, dynamic> json) {
  return BaseResponseHeroes(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => HeroesModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BaseResponseHeroesToJson(BaseResponseHeroes instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
