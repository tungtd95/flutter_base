import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_city_data.freezed.dart';

@freezed
class AddCityData with _$AddCityData {
  const factory AddCityData({
    @Default(Status.init()) Status status,
    List<City>? cities,
  }) = _AddCityData;
}
