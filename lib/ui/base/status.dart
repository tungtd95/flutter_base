import 'package:flutter_base/data/utils/base_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const factory Status.init() = Init;

  const factory Status.loading({@Default(0) int id}) = Loading;

  const factory Status.idle() = Idle;

  const factory Status.submitting() = Submmiting;

  const factory Status.error(BaseException error) = Error;

  const factory Status.success() = Success;

  const factory Status.completed() = Completed;
}
