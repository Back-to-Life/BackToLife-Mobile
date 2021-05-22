// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBaseResponseModel _$HomeBaseResponseModelFromJson(
    Map<String, dynamic> json) {
  return HomeBaseResponseModel(
    json['success'] as bool,
    HomeUserModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeBaseResponseModelToJson(
        HomeBaseResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
