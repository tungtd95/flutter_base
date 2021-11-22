import 'package:flutter/material.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/ui/addcity/add_city_widget.dart';
import 'package:flutter_base/ui/home/home_cubit.dart';
import 'package:flutter_base/ui/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeCubit _cubit = getIt.get();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _cubit.subscribeCitiesStream();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _cubit,
      listener: (context, state) {},
      child: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: _buildPage,
      ),
    );
  }

  Widget _buildPage(BuildContext context, HomeState state) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AddCityWidget();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: _buildContent(state),
    );
  }

  Widget _buildContent(HomeState state) {
    final cities = state.cities ?? [];
    return Center(
      child: Text("cities: ${cities.map((e) => e.name ?? '').join(", ")}"),
    );
  }
}
