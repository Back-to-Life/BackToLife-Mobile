import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'authentication_register_response_model.g.dart';

@JsonSerializable()
class AuthenticationRegisterResponseModel
    extends INetworkModel<AuthenticationRegisterResponseModel> {
  final bool success;
  final String token;
  final String unicId;

  AuthenticationRegisterResponseModel({this.success, this.token, this.unicId});

  @override
  AuthenticationRegisterResponseModel fromJson(Map<String, Object> json) {
    return _$AuthenticationRegisterResponseModelFromJson(json);
  }

  @override
  Map<String, Object> toJson() {
    return _$AuthenticationRegisterResponseModelToJson(this);
  }
}
