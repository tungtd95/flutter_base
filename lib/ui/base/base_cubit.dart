import 'package:flutter_base/ui/base/base_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<D extends BaseData> extends Cubit<D> {
  BaseCubit(D initialData) : super(initialData);

  void dispose();
}
