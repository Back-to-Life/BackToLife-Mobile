import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  UserProfileModel({
    this.point,
    this.loginDate,
    this.name,
    this.email,
    this.password,
    this.login,
    this.randomCode,
    this.v,
    this.userProfileModelId,
    this.refreshToken,
    this.unicId,
    this.imageUrl,
  });

  final int? point;
  final DateTime? loginDate;
  final String? name;
  final String? email;
  final String? password;
  final bool? login;
  final int? randomCode;
  final int? v;
  final int? userProfileModelId;
  final String? refreshToken;
  final String? unicId;
  final String? imageUrl;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$UserProfileModelToJson(this);
  }
}
