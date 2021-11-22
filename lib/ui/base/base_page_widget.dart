import 'package:flutter/material.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePageState<W extends StatefulWidget, C extends BaseCubit<S>,
    S> extends State<W> {
  C cubit = getIt.get();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      onViewCreated();
    });
  }

  void onViewCreated() {}

  void onStateChange(BuildContext context, S state) {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<C, S>(
      bloc: cubit,
      listener: onStateChange,
      child: BlocBuilder<C, S>(
        bloc: cubit,
        builder: buildPage,
      ),
    );
  }

  Widget buildPage(BuildContext context, S state);

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }
}
