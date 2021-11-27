import 'package:flutter/material.dart';
import 'package:flutter_base/data/utils/base_exception.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/base_data.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePageState<W extends StatefulWidget, C extends BaseCubit<D>,
    D extends BaseData> extends State<W> {
  C cubit = getIt.get();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      onViewCreated();
    });
  }

  void onViewCreated() {}

  void onDataChange(BuildContext context, D data) {
    final status = data.status;
    if (status is Error) {
      showError(status.err);
    }
  }

  // override this method for display custom error
  void showError(BaseException error) {
    // this function could be useful for handle network error or authentication
    showSnackMessage(error.message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<C, D>(
      bloc: cubit,
      listener: onDataChange,
      child: BlocBuilder<C, D>(
        bloc: cubit,
        builder: buildPage,
      ),
    );
  }

  Widget buildPage(BuildContext context, D data);

  void showSnackMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1000),
    ));
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }
}
