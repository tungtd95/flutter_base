import 'package:flutter/material.dart';
import 'package:flutter_base/ui/addcity/add_city_cubit.dart';
import 'package:flutter_base/ui/addcity/add_city_state.dart';
import 'package:flutter_base/ui/addcity/components/city_widget.dart';
import 'package:flutter_base/ui/addcity/components/search_bar_widget.dart';
import 'package:flutter_base/ui/base/base_page_widget.dart';
import 'package:flutter_base/ui/base/screen_state.dart';

class AddCityWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCityWidgetState();
  }
}

class _AddCityWidgetState
    extends BasePageState<AddCityWidget, AddCityCubit, AddCityState> {
  FocusNode _searchFocusNode = FocusNode();

  @override
  void onViewCreated() {
    super.onViewCreated();
    _searchFocusNode.requestFocus();
  }

  @override
  void onStateChange(BuildContext context, AddCityState state) {
    super.onStateChange(context, state);
    final screenState = state.screenState;
    if (screenState is Completed) {
      Navigator.of(context).pop();
    } else if (screenState is Error) {
      showSnackMessage(screenState.message);
    }
  }

  @override
  Widget buildPage(BuildContext context, AddCityState state) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64),
          Container(
            child: SearchBarWidget(
              onSearch: cubit.searchCity,
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
            cubit.addCityToFav(city);
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
