import 'package:json_annotation/json_annotation.dart';

part 'email_token_request_model.g.dart';

@JsonSerializable()
class EmailTokenRequestModel {
  final String email;
  final int forgotCode;
  final String password;

  EmailTokenRequestModel(
      {required this.email, required this.forgotCode, required this.password});

  factory EmailTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EmailTokenRequestModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$EmailTokenRequestModelToJson(this);
  }
}
