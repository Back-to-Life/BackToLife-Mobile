// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroesModel _$HeroesModelFromJson(Map<String, dynamic> json) {
  return HeroesModel(
    ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    names: (json['names'] as List<dynamic>?)?.map((e) => e as String).toList(),
    points: (json['points'] as List<dynamic>?)?.map((e) => e as int).toList(),
    imageUrls:
        (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$HeroesModelToJson(HeroesModel instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'names': instance.names,
      'points': instance.points,
      'imageUrls': instance.imageUrls,
    };
