import 'package:flutter_base/data/utils/base_exception.dart';

abstract class Status {}

class Init extends Status {
  Init();
}

class Loading extends Status {
  final int id;

  Loading({this.id = 0});
}

class Error extends Status {
  final BaseException err;

  Error(this.err);
}

class Success extends Status {
  Success();
}

class Completed extends Status {
  Completed();
}
