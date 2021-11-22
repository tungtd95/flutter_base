import 'package:flutter/material.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/ui/addcity/add_city_cubit.dart';
import 'package:flutter_base/ui/addcity/add_city_state.dart';
import 'package:flutter_base/ui/addcity/components/city_widget.dart';
import 'package:flutter_base/ui/addcity/components/search_bar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCityWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCityWidgetState();
  }
}

class _AddCityWidgetState extends State<AddCityWidget> {
  AddCityCubit _cubit = getIt.get();

  FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64),
          Container(
            child: SearchBarWidget(
              onSearch: _cubit.searchCity,
              focusNode: _searchFocusNode,
            ),
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
            child: _buildCities(),
          )
        ],
      ),
    );
  }

  Widget _buildCities() {
    return BlocBuilder<AddCityCubit, AddCityState>(
      bloc: _cubit,
      builder: (context, state) {
        final cities = state.cities ?? [];
        return ListView.separated(
          itemBuilder: (context, index) {
            return CityWidget(
              cityName: cities[index].getFullName(),
              onTap: () {
                print("WTF ${cities[index].getFullName()}");
              },
            );
          },
          itemCount: cities.length,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 4);
          },
        );
      },
    );
  }
}
