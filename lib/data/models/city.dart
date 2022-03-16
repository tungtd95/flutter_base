import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
@entity
class City extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? name;
  final String? country;
  final String? state;
  final double? lat;
  final double? lon;

  City({this.id, this.name, this.country, this.state, this.lat, this.lon});

  String getFullName() {
    final nameArr = [];
    if (name != null && name!.isNotEmpty) {
      nameArr.add(name!);
    }
    if (state != null && state!.isNotEmpty) {
      nameArr.add(state!);
    }
    if (country != null && country!.isNotEmpty) {
      nameArr.add(country!);
    }
    return nameArr.join(", ");
  }

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  List<Object?> get props => [id, name, country, state, lat, lon];
}
