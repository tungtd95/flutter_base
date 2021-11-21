// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_city_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddCityStateTearOff {
  const _$AddCityStateTearOff();

  _AddCityState call(
      {ScreenState screenState = const ScreenState.init(),
      List<City>? cities}) {
    return _AddCityState(
      screenState: screenState,
      cities: cities,
    );
  }
}

/// @nodoc
const $AddCityState = _$AddCityStateTearOff();

/// @nodoc
mixin _$AddCityState {
  ScreenState get screenState => throw _privateConstructorUsedError;
  List<City>? get cities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCityStateCopyWith<AddCityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCityStateCopyWith<$Res> {
  factory $AddCityStateCopyWith(
          AddCityState value, $Res Function(AddCityState) then) =
      _$AddCityStateCopyWithImpl<$Res>;
  $Res call({ScreenState screenState, List<City>? cities});

  $ScreenStateCopyWith<$Res> get screenState;
}

/// @nodoc
class _$AddCityStateCopyWithImpl<$Res> implements $AddCityStateCopyWith<$Res> {
  _$AddCityStateCopyWithImpl(this._value, this._then);

  final AddCityState _value;
  // ignore: unused_field
  final $Res Function(AddCityState) _then;

  @override
  $Res call({
    Object? screenState = freezed,
    Object? cities = freezed,
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
abstract class _$AddCityStateCopyWith<$Res>
    implements $AddCityStateCopyWith<$Res> {
  factory _$AddCityStateCopyWith(
          _AddCityState value, $Res Function(_AddCityState) then) =
      __$AddCityStateCopyWithImpl<$Res>;
  @override
  $Res call({ScreenState screenState, List<City>? cities});

  @override
  $ScreenStateCopyWith<$Res> get screenState;
}

/// @nodoc
class __$AddCityStateCopyWithImpl<$Res> extends _$AddCityStateCopyWithImpl<$Res>
    implements _$AddCityStateCopyWith<$Res> {
  __$AddCityStateCopyWithImpl(
      _AddCityState _value, $Res Function(_AddCityState) _then)
      : super(_value, (v) => _then(v as _AddCityState));

  @override
  _AddCityState get _value => super._value as _AddCityState;

  @override
  $Res call({
    Object? screenState = freezed,
    Object? cities = freezed,
  }) {
    return _then(_AddCityState(
      screenState: screenState == freezed
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      cities: cities == freezed
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>?,
    ));
  }
}

/// @nodoc

class _$_AddCityState implements _AddCityState {
  const _$_AddCityState(
      {this.screenState = const ScreenState.init(), this.cities});

  @JsonKey(defaultValue: const ScreenState.init())
  @override
  final ScreenState screenState;
  @override
  final List<City>? cities;

  @override
  String toString() {
    return 'AddCityState(screenState: $screenState, cities: $cities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCityState &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState) &&
            const DeepCollectionEquality().equals(other.cities, cities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, screenState, const DeepCollectionEquality().hash(cities));

  @JsonKey(ignore: true)
  @override
  _$AddCityStateCopyWith<_AddCityState> get copyWith =>
      __$AddCityStateCopyWithImpl<_AddCityState>(this, _$identity);
}

abstract class _AddCityState implements AddCityState {
  const factory _AddCityState({ScreenState screenState, List<City>? cities}) =
      _$_AddCityState;

  @override
  ScreenState get screenState;
  @override
  List<City>? get cities;
  @override
  @JsonKey(ignore: true)
  _$AddCityStateCopyWith<_AddCityState> get copyWith =>
      throw _privateConstructorUsedError;
}
