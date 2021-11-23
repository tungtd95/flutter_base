// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScreenStateTearOff {
  const _$ScreenStateTearOff();

  Init init() {
    return const Init();
  }

  Loading loading() {
    return const Loading();
  }

  Idle idle() {
    return const Idle();
  }

  Submmiting submitting() {
    return const Submmiting();
  }

  Error error(String message) {
    return Error(
      message,
    );
  }

  Success success() {
    return const Success();
  }

  Completed completed() {
    return const Completed();
  }
}

/// @nodoc
const $ScreenState = _$ScreenStateTearOff();

/// @nodoc
mixin _$ScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function() submitting,
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Idle value) idle,
    required TResult Function(Submmiting value) submitting,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Completed value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenStateCopyWith<$Res> {
  factory $ScreenStateCopyWith(
          ScreenState value, $Res Function(ScreenState) then) =
      _$ScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScreenStateCopyWithImpl<$Res> implements $ScreenStateCopyWith<$Res> {
  _$ScreenStateCopyWithImpl(this._value, this._then);

  final ScreenState _value;
  // ignore: unused_field
  final $Res Function(ScreenState) _then;
}

/// @nodoc
abstract class $InitCopyWith<$Res> {
  factory $InitCopyWith(Init value, $Res Function(Init) then) =
      _$InitCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitCopyWithImpl<$Res> extends _$ScreenStateCopyWithImpl<$Res>
    implements $InitCopyWith<$Res> {
  _$InitCopyWithImpl(Init _value, $Res Function(Init) _then)
      : super(_value, (v) => _then(v as Init));

  @override
  Init get _value => super._value as Init;
}

/// @nodoc

class _$Init implements Init {
  const _$Init();

  @override
  String toString() {
    return 'ScreenState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function() submitting,
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() completed,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Idle value) idle,
    required TResult Function(Submmiting value) submitting,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Completed value) completed,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements ScreenState {
  const factory Init() = _$Init;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$ScreenStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function() submitting,
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Idle value) idle,
    required TResult Function(Submmiting value) submitting,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Completed value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ScreenState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$ScreenStateCopyWithImpl<$Res>
    implements $IdleCopyWith<$Res> {
  _$IdleCopyWithImpl(Idle _value, $Res Function(Idle) _then)
      : super(_value, (v) => _then(v as Idle));

  @override
  Idle get _value => super._value as Idle;
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'ScreenState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function() submitting,
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() completed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Idle value) idle,
    required TResult Function(Submmiting value) submitting,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Completed value) completed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements ScreenState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $SubmmitingCopyWith<$Res> {
  factory $SubmmitingCopyWith(
          Submmiting value, $Res Function(Submmiting) then) =
      _$SubmmitingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SubmmitingCopyWithImpl<$Res> extends _$ScreenStateCopyWithImpl<$Res>
    implements $SubmmitingCopyWith<$Res> {
  _$SubmmitingCopyWithImpl(Submmiting _value, $Res Function(Submmiting) _then)
      : super(_value, (v) => _then(v as Submmiting));

  @override
  Submmiting get _value => super._value as Submmiting;
}

/// @nodoc

class _$Submmiting implements Submmiting {
  const _$Submmiting();

  @override
  String toString() {
    return 'ScreenState.submitting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Submmiting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function() submitting,
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() completed,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Idle value) idle,
    required TResult Function(Submmiting value) submitting,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Completed value) completed,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class Submmiting implements ScreenState {
  const factory Submmiting() = _$Submmiting;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$ScreenStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ScreenState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function() submitting,
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() completed,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Idle value) idle,
    required TResult Function(Submmiting value) submitting,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Completed value) completed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ScreenState {
  const factory Error(String message) = _$Error;

  String get message;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$ScreenStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;
}

/// @nodoc

class _$Success implements Success {
  const _$Success();

  @override
  String toString() {
    return 'ScreenState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function() submitting,
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() completed,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Idle value) idle,
    required TResult Function(Submmiting value) submitting,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Completed value) completed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements ScreenState {
  const factory Success() = _$Success;
}

/// @nodoc
abstract class $CompletedCopyWith<$Res> {
  factory $CompletedCopyWith(Completed value, $Res Function(Completed) then) =
      _$CompletedCopyWithImpl<$Res>;
}

/// @nodoc
class _$CompletedCopyWithImpl<$Res> extends _$ScreenStateCopyWithImpl<$Res>
    implements $CompletedCopyWith<$Res> {
  _$CompletedCopyWithImpl(Completed _value, $Res Function(Completed) _then)
      : super(_value, (v) => _then(v as Completed));

  @override
  Completed get _value => super._value as Completed;
}

/// @nodoc

class _$Completed implements Completed {
  const _$Completed();

  @override
  String toString() {
    return 'ScreenState.completed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Completed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() idle,
    required TResult Function() submitting,
    required TResult Function(String message) error,
    required TResult Function() success,
    required TResult Function() completed,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? idle,
    TResult Function()? submitting,
    TResult Function(String message)? error,
    TResult Function()? success,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Idle value) idle,
    required TResult Function(Submmiting value) submitting,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Completed value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Idle value)? idle,
    TResult Function(Submmiting value)? submitting,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Completed value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class Completed implements ScreenState {
  const factory Completed() = _$Completed;
}
