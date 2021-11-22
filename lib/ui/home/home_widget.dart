import 'package:flutter/material.dart';
import 'package:flutter_base/ui/addcity/add_city_widget.dart';
import 'package:flutter_base/ui/base/base_page_widget.dart';
import 'package:flutter_base/ui/home/home_cubit.dart';
import 'package:flutter_base/ui/home/home_state.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends BasePageState<HomeWidget, HomeCubit, HomeState> {
  @override
  void onViewCreated() {
    super.onViewCreated();
    cubit.subscribeCitiesStream();
  }

  @override
  Widget buildPage(BuildContext context, HomeState state) {
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
