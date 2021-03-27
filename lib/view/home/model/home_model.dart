import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends BaseModel {
  int userId;
  int id;
  String title;
  bool completed;

  HomeModel({this.userId, this.id, this.title, this.completed});

  @override
  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }

  @override
  HomeModel fromJson(Map<String, Object> json) {
    return _$HomeModelFromJson(json);
  }
}
