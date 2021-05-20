import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'heroes_model.g.dart';

@JsonSerializable()
class HeroesModel {
  HeroesModel({
    this.point,
    this.loginDate,
    this.id,
    this.name,
    this.email,
    this.password,
    this.login,
    this.randomCode,
    this.heroesModelId,
    this.imageUrl,
    this.v,
  });

  final int? point;
  final DateTime? loginDate;
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final bool? login;
  final int? randomCode;
  final int? heroesModelId;
  final int? v;
  final String? imageUrl;

  
  factory HeroesModel.fromJson(Map<String, dynamic> json) =>
      _$HeroesModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$HeroesModelToJson(this);
  }
}
