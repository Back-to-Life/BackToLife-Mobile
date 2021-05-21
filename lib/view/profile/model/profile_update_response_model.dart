import 'package:json_annotation/json_annotation.dart';

part 'profile_update_response_model.g.dart';

@JsonSerializable()
class ImageUpdateResponseModel {
  final bool success;

  ImageUpdateResponseModel(this.success);

  factory ImageUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ImageUpdateResponseModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ImageUpdateResponseModelToJson(this);
  }
}
