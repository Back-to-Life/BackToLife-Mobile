import 'package:json_annotation/json_annotation.dart';

part 'date_response_model.g.dart';

@JsonSerializable()
class DateResponseModel {
  final bool success;

  DateResponseModel(this.success);

  factory DateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DateResponseModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$DateResponseModelToJson(this);
  }
}
