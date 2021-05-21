import 'package:json_annotation/json_annotation.dart';

part 'profile_update_request_model.g.dart';

@JsonSerializable()
class ImageUpdateRequestModel {
  final String imageUrl;

  ImageUpdateRequestModel({required this.imageUrl});

  factory ImageUpdateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ImageUpdateRequestModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ImageUpdateRequestModelToJson(this);
  }
}
