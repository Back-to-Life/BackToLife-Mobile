import 'package:json_annotation/json_annotation.dart';

part 'account_settings_request_model.g.dart';

@JsonSerializable()
class AccountSettingsModel {
  final String? name;
  final String? email;

  AccountSettingsModel({this.name, this.email});

  factory AccountSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountSettingsModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$AccountSettingsModelToJson(this);
  }
}
