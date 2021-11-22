import 'package:flutter/material.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/ui/addcity/add_city_cubit.dart';
import 'package:flutter_base/ui/addcity/add_city_state.dart';
import 'package:flutter_base/ui/addcity/components/city_widget.dart';
import 'package:flutter_base/ui/addcity/components/search_bar_widget.dart';
import 'package:flutter_base/ui/base/screen_state.dart';
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
    return BlocListener<AddCityCubit, AddCityState>(
      bloc: _cubit,
      listener: (_, state) {
        if (state.screenState is Completed) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<AddCityCubit, AddCityState>(
        bloc: _cubit,
        builder: _buildPage,
      ),
    );
  }

  Widget _buildPage(BuildContext context, AddCityState state) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64),
          Container(
            child: SearchBarWidget(
              onSearch: _cubit.searchCity,
              focusNode: _searchFocusNode,
              loading: state.screenState is Loading,
            ),
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
            child: _buildCities(state),
          )
        ],
      ),
    );
  }

  Widget _buildCities(AddCityState state) {
    final cities = state.cities ?? [];
    if (cities.isEmpty) return Container();
    return ListView.separated(
      itemBuilder: (context, index) {
        final city = cities[index];
        return CityWidget(
          cityName: city.getFullName(),
          onTap: () {
            _cubit.addCityToFav(city);
          },
        );
      },
      itemCount: cities.length,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 4);
      },
    );
  }
}
