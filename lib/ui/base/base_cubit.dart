import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(S initialState) : super(initialState);

  void dispose();
}
