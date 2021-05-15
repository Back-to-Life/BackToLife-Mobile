import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'authentication_response_model.g.dart';

@JsonSerializable()
class AuthenticationResponseModel
    extends INetworkModel<AuthenticationResponseModel> {
  final bool? success;
  final String? token;
  final String? id;

  AuthenticationResponseModel({this.success, this.token, this.id});

  @override
  AuthenticationResponseModel fromJson(Map<String, Object?> json) {
    return _$AuthenticationResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$AuthenticationResponseModelToJson(this);
  }
}
