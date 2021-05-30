import 'package:json_annotation/json_annotation.dart';

part 'account_settings_request_model.g.dart';

@JsonSerializable()
class AccountSettingsModel {
  final String? username;
  final String? email;
  final String? password;

  AccountSettingsModel({this.username, this.email, this.password});

  factory AccountSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountSettingsModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$AccountSettingsModelToJson(this);
  }
}
