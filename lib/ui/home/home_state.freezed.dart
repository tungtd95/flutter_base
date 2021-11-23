// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {ScreenState screenState = const ScreenState.init(),
      List<City>? cities,
      List<WeatherCity>? weathers}) {
    return _HomeState(
      screenState: screenState,
      cities: cities,
      weathers: weathers,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  ScreenState get screenState => throw _privateConstructorUsedError;
  List<City>? get cities => throw _privateConstructorUsedError;
  List<WeatherCity>? get weathers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {ScreenState screenState,
      List<City>? cities,
      List<WeatherCity>? weathers});

  $ScreenStateCopyWith<$Res> get screenState;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? screenState = freezed,
    Object? cities = freezed,
    Object? weathers = freezed,
  }) {
    return _then(_value.copyWith(
      screenState: screenState == freezed
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      cities: cities == freezed
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>?,
      weathers: weathers == freezed
          ? _value.weathers
          : weathers // ignore: cast_nullable_to_non_nullable
              as List<WeatherCity>?,
    ));
  }

  @override
  $ScreenStateCopyWith<$Res> get screenState {
    return $ScreenStateCopyWith<$Res>(_value.screenState, (value) {
      return _then(_value.copyWith(screenState: value));
    });
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ScreenState screenState,
      List<City>? cities,
      List<WeatherCity>? weathers});

  @override
  $ScreenStateCopyWith<$Res> get screenState;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? screenState = freezed,
    Object? cities = freezed,
    Object? weathers = freezed,
  }) {
    return _then(_HomeState(
      screenState: screenState == freezed
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      cities: cities == freezed
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>?,
      weathers: weathers == freezed
          ? _value.weathers
          : weathers // ignore: cast_nullable_to_non_nullable
              as List<WeatherCity>?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.screenState = const ScreenState.init(),
      this.cities,
      this.weathers});

  @JsonKey(defaultValue: const ScreenState.init())
  @override
  final ScreenState screenState;
  @override
  final List<City>? cities;
  @override
  final List<WeatherCity>? weathers;

  @override
  String toString() {
    return 'HomeState(screenState: $screenState, cities: $cities, weathers: $weathers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState) &&
            const DeepCollectionEquality().equals(other.cities, cities) &&
            const DeepCollectionEquality().equals(other.weathers, weathers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      screenState,
      const DeepCollectionEquality().hash(cities),
      const DeepCollectionEquality().hash(weathers));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {ScreenState screenState,
      List<City>? cities,
      List<WeatherCity>? weathers}) = _$_HomeState;

  @override
  ScreenState get screenState;
  @override
  List<City>? get cities;
  @override
  List<WeatherCity>? get weathers;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
