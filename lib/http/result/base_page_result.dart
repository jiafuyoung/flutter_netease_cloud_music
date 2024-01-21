import 'package:json_annotation/json_annotation.dart';

part 'base_page_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasePageRusult<T> {
  @JsonKey(name: "offse")
  int? offset;
  @JsonKey(name: "size")
  int? size;
  @JsonKey(name: "pageCount")
  int? pageCount;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "datas")
  List<T>? datas;

  BasePageRusult(
      this.offset, this.size, this.pageCount, this.total, this.datas);

  factory BasePageRusult.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BasePageRusultFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BasePageRusultToJson(this, toJsonT);
}
