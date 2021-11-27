import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/common/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_details_data.freezed.dart';

@freezed
class CityDetailsData with _$CityDetailsData {
  const factory CityDetailsData({
    @Default(Status.init()) Status status,
    WeatherCity? weather,
  }) = _CityDetailsData;
}
