import 'package:json_annotation/json_annotation.dart';

part 'scan_response_model.g.dart';

@JsonSerializable()
class ScanResponseModel {
  final bool? success;

  ScanResponseModel({this.success});

  factory ScanResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ScanResponseModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ScanResponseModelToJson(this);
  }
}
