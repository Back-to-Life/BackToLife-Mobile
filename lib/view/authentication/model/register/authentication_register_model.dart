import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'authentication_register_model.g.dart';

@JsonSerializable()
class AuthenticationRegisterModel
    extends INetworkModel<AuthenticationRegisterModel> {
  final String? name;
  final String? email;
  final String? password;

  AuthenticationRegisterModel({this.name, this.email, this.password});

  @override
  AuthenticationRegisterModel fromJson(Map<String, Object?> json) {
    return _$AuthenticationRegisterModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$AuthenticationRegisterModelToJson(this);
  }
}
