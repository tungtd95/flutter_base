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
      {Status status = const Status.init(), List<City>? cities}) {
    return _AddCityState(
      status: status,
      cities: cities,
    );
  }
}

/// @nodoc
const $AddCityState = _$AddCityStateTearOff();

/// @nodoc
mixin _$AddCityState {
  Status get status => throw _privateConstructorUsedError;
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
  $Res call({Status status, List<City>? cities});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$AddCityStateCopyWithImpl<$Res> implements $AddCityStateCopyWith<$Res> {
  _$AddCityStateCopyWithImpl(this._value, this._then);

  final AddCityState _value;
  // ignore: unused_field
  final $Res Function(AddCityState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? cities = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      cities: cities == freezed
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>?,
    ));
  }

  @override
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
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
  $Res call({Status status, List<City>? cities});

  @override
  $StatusCopyWith<$Res> get status;
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
    Object? status = freezed,
    Object? cities = freezed,
  }) {
    return _then(_AddCityState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      cities: cities == freezed
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>?,
    ));
  }
}

/// @nodoc

class _$_AddCityState implements _AddCityState {
  const _$_AddCityState({this.status = const Status.init(), this.cities});

  @JsonKey(defaultValue: const Status.init())
  @override
  final Status status;
  @override
  final List<City>? cities;

  @override
  String toString() {
    return 'AddCityState(status: $status, cities: $cities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCityState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.cities, cities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(cities));

  @JsonKey(ignore: true)
  @override
  _$AddCityStateCopyWith<_AddCityState> get copyWith =>
      __$AddCityStateCopyWithImpl<_AddCityState>(this, _$identity);
}

abstract class _AddCityState implements AddCityState {
  const factory _AddCityState({Status status, List<City>? cities}) =
      _$_AddCityState;

  @override
  Status get status;
  @override
  List<City>? get cities;
  @override
  @JsonKey(ignore: true)
  _$AddCityStateCopyWith<_AddCityState> get copyWith =>
      throw _privateConstructorUsedError;
}
