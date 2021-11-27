import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/common/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.init()) Status status,
    List<City>? cities,
    List<WeatherCity>? weathers,
  }) = _HomeState;
}
