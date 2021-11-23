import 'package:flutter_base/ui/base/screen_state.dart';
import 'package:flutter_base/ui/common/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_details_state.freezed.dart';

@freezed
class CityDetailsState with _$CityDetailsState {
  const factory CityDetailsState({
    @Default(ScreenState.init()) ScreenState screenState,
    WeatherCity? weather,
  }) = _CityDetailsState;
}
