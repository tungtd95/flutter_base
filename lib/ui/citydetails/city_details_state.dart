import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/common/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_details_state.freezed.dart';

@freezed
class CityDetailsState with _$CityDetailsState {
  const factory CityDetailsState({
    @Default(Status.init()) Status status,
    WeatherCity? weather,
  }) = _CityDetailsState;
}
