import 'package:json_annotation/json_annotation.dart';

part 'firebase_model.g.dart';

@JsonSerializable()
class CheckArduinoModel {
  final bool ktu;

  CheckArduinoModel(this.ktu);

  factory CheckArduinoModel.fromJson(Map<String, dynamic> json) =>
      _$CheckArduinoModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$CheckArduinoModelToJson(this);
  }
}
