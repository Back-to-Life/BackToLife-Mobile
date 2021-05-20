import 'package:json_annotation/json_annotation.dart';

part 'scan_request_model.g.dart';

@JsonSerializable()
class ScanRequestModel {
  final String? pointName;

  ScanRequestModel({this.pointName});

  
  factory ScanRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ScanRequestModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ScanRequestModelToJson(this);
  }
}
