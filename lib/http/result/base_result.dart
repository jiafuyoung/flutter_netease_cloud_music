import 'package:json_annotation/json_annotation.dart';

part 'base_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResult {
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "statusMessage")
  String? statusMessage;
  @JsonKey(name: "data")
  Map<String, dynamic>? data;
  @JsonKey(name: "extra")
  Map<String, dynamic>? extra;

  BaseResult({this.statusCode, this.statusMessage, this.data, this.extra});

  factory BaseResult.fromJson(Map<String, dynamic> json) =>
      _$BaseResultFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResultToJson(this);
}
