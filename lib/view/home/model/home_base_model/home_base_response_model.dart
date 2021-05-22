import 'package:backtolife/view/home/model/user_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_base_response_model.g.dart';

@JsonSerializable()
class HomeBaseResponseModel {
  final bool success;
  final HomeUserModel data;

  HomeBaseResponseModel(this.success, this.data);

  factory HomeBaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeBaseResponseModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$HomeBaseResponseModelToJson(this);
  }
}
