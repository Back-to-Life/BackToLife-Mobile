import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class HomeUserModel {
  HomeUserModel({
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

  factory HomeUserModel.fromJson(Map<String, dynamic> json) =>
      _$HomeUserModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$HomeUserModelToJson(this);
  }
}
