import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'al.g.dart';

@JsonSerializable()
class Al {
  int? id;
  String? name;
  String? picUrl;
  List<dynamic>? tns;
  @JsonKey(name: 'pic_str')
  String? picStr;
  int? pic;

  Al({this.id, this.name, this.picUrl, this.tns, this.picStr, this.pic});

  @override
  String toString() {
    return 'Al(id: $id, name: $name, picUrl: $picUrl, tns: $tns, picStr: $picStr, pic: $pic)';
  }

  factory Al.fromJson(Map<String, dynamic> json) => _$AlFromJson(json);

  Map<String, dynamic> toJson() => _$AlToJson(this);

  Al copyWith({
    int? id,
    String? name,
    String? picUrl,
    List<dynamic>? tns,
    String? picStr,
    int? pic,
  }) {
    return Al(
      id: id ?? this.id,
      name: name ?? this.name,
      picUrl: picUrl ?? this.picUrl,
      tns: tns ?? this.tns,
      picStr: picStr ?? this.picStr,
      pic: pic ?? this.pic,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Al) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      picUrl.hashCode ^
      tns.hashCode ^
      picStr.hashCode ^
      pic.hashCode;
}
