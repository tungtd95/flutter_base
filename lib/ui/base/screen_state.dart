import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_state.freezed.dart';

@freezed
class ScreenState with _$ScreenState {
  const factory ScreenState.init() = Init;

  const factory ScreenState.loading() = Loading;

  const factory ScreenState.idle() = Idle;

  const factory ScreenState.submitting() = Submmiting;

  const factory ScreenState.error() = Error;

  const factory ScreenState.success() = Success;
}
