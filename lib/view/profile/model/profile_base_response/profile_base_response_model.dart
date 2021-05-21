import 'package:backtolife/view/profile/model/profile_model/profile_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_base_response_model.g.dart';

@JsonSerializable()
class ProfileBaseResponseModel {
  final bool success;
  final UserProfileModel data;

  ProfileBaseResponseModel(this.success, this.data);

  factory ProfileBaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileBaseResponseModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ProfileBaseResponseModelToJson(this);
  }
}
