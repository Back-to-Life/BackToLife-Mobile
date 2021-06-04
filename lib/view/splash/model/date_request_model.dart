import 'package:json_annotation/json_annotation.dart';

part 'date_request_model.g.dart';

@JsonSerializable()
class DateRequestModel {
  final String? loginDate;

  DateRequestModel({this.loginDate});

  factory DateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DateRequestModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$DateRequestModelToJson(this);
  }
}
