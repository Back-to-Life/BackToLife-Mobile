import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_code_model.g.dart';

@JsonSerializable()
class RegisterCode extends INetworkModel<RegisterCode> {
  // final String? name;
  final String? email;
  // final String? password;
  final int? randomCodeReq;

  RegisterCode({this.email, this.randomCodeReq});

  @override
  RegisterCode fromJson(Map<String, dynamic> json) {
    return _$RegisterCodeFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterCodeToJson(this);
  }
}
