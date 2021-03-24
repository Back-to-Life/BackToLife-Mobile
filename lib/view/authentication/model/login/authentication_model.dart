import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'authentication_model.g.dart';

@JsonSerializable()
class AuthenticationModel extends INetworkModel<AuthenticationModel> {
  final String email;
  final String password;

  AuthenticationModel({this.email, this.password});

  @override
  AuthenticationModel fromJson(Map<String, Object> json) {
    return _$AuthenticationModelFromJson(json);
  }

  @override
  Map<String, Object> toJson() {
    return _$AuthenticationModelToJson(this);
  }
}
