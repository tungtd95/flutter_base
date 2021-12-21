import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
@entity
class City {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name;
  String? country;
  String? state;
  double? lat;
  double? lon;

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
}
