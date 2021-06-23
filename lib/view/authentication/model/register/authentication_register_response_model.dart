import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'authentication_register_response_model.g.dart';

@JsonSerializable()
class AuthenticationRegisterResponseModel
    extends INetworkModel<AuthenticationRegisterResponseModel> {
  final String? message;
  final bool? register;
  final String? unicID;
  final String? rtoken;

  AuthenticationRegisterResponseModel(
      {this.unicID, this.rtoken, this.message, this.register});

  @override
  AuthenticationRegisterResponseModel fromJson(Map<String, Object?> json) {
    return _$AuthenticationRegisterResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$AuthenticationRegisterResponseModelToJson(this);
  }
}
