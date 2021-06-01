import 'package:json_annotation/json_annotation.dart';

part 'token_request_model.g.dart';

@JsonSerializable()
class TokenResponseModel {
  final bool success;

  TokenResponseModel(this.success);

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$TokenResponseModelToJson(this);
  }
}
