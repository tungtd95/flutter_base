import 'package:equatable/equatable.dart';
import 'package:flutter_base/ui/base/status.dart';

abstract class BaseData extends Equatable {
  final Status status;

  BaseData(this.status);
}
