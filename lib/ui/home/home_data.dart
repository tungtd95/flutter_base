import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/common/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_data.freezed.dart';

@freezed
class HomeData with _$HomeData {
  const factory HomeData({
    @Default(Status.init()) Status status,
    List<City>? cities,
    List<WeatherCity>? weathers,
  }) = _HomeData;
}
