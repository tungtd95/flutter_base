import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_city_state.freezed.dart';

@freezed
class AddCityState with _$AddCityState {
  const factory AddCityState({
    @Default(Status.init()) Status status,
    List<City>? cities,
  }) = _AddCityState;
}
