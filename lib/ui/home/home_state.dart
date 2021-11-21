import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/ui/base/screen_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(ScreenState.init()) ScreenState screenState,
    List<City>? cities,
  }) = _HomeState;
}
