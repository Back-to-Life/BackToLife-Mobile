import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_code_response_model.g.dart';

@JsonSerializable()
class RegisterCodeResponseModel
    extends INetworkModel<RegisterCodeResponseModel> {
  final bool? success;

  RegisterCodeResponseModel({this.success});

  @override
  RegisterCodeResponseModel fromJson(Map<String, dynamic> json) {
    return _$RegisterCodeResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterCodeResponseModelToJson(this);
  }
}
