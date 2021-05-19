import 'package:backtolife/view/heroes/model/heroes_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseHeroes {
  List<HeroesModel>? data;

  BaseResponseHeroes({this.data});

  factory BaseResponseHeroes.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseHeroesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BaseResponseHeroesToJson(this);
  }
}
