import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/data/utils/base_exception.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/base_data.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePageState<W extends StatefulWidget, C extends BaseCubit<D>,
        D extends BaseData> extends State<W>
    with RouteAware, WidgetsBindingObserver {
  C cubit = getIt.get();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onViewCreated();
    });
  }

  void onViewCreated() {
    debugPrint("${objectRuntimeType(this, "")} onViewCreated");
  }

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
    return BlocProvider<C>(
      create: (context) => cubit,
      child: BlocListener<C, D>(
        bloc: cubit,
        listener: onDataChange,
        child: buildPage(context),
      ),
    );
  }

  Widget buildPage(BuildContext context);

  Widget blocBuilder({required Widget Function(BuildContext, D) builder}) =>
      BlocBuilder<C, D>(builder: builder);

  void showSnackMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1000),
    ));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("${objectRuntimeType(this, "")} ${state.toString()}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getIt<RouteObserver<ModalRoute<void>>>()
        .subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    debugPrint("${objectRuntimeType(this, "")} dispose");
    cubit.dispose();
    getIt<RouteObserver<ModalRoute<void>>>().unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didPop() {
    debugPrint("${objectRuntimeType(this, "")} didPop");
    super.didPop();
  }

  @override
  void didPopNext() {
    debugPrint("${objectRuntimeType(this, "")} didPopNext");
    super.didPopNext();
  }

  @override
  void didPush() {
    debugPrint("${objectRuntimeType(this, "")} didPush");
    super.didPush();
  }

  @override
  void didPushNext() {
    debugPrint("${objectRuntimeType(this, "")} didPushNext");
    super.didPushNext();
  }
}
