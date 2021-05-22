import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'heroes_model.g.dart';

@JsonSerializable()
class HeroesModel {
  HeroesModel({
    this.ids,
    this.names,
    this.points,
    this.imageUrls,
  });

  final List<String>? ids;
  final List<String>? names;
  final List<int>? points;
  final List<String>? imageUrls;

  factory HeroesModel.fromJson(Map<String, dynamic> json) =>
      _$HeroesModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$HeroesModelToJson(this);
  }
}




/*

  factory HeroesModel.fromJson(Map<String, dynamic> json) =>
      _$HeroesModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$HeroesModelToJson(this);
  }
  */