import 'package:json_annotation/json_annotation.dart';

part 'meta_response.g.dart';

@JsonSerializable()
class MetaRes {
  @JsonKey(name: 'cod')
  String? code;
  String? message;

  MetaRes({this.code, this.message});

  factory MetaRes.fromJson(Map<String, dynamic> json) =>
      _$MetaResFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResToJson(this);
}
