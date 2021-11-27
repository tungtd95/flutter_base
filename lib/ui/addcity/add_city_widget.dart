import 'package:flutter/material.dart';
import 'package:flutter_base/ui/addcity/add_city_cubit.dart';
import 'package:flutter_base/ui/addcity/add_city_data.dart';
import 'package:flutter_base/ui/addcity/components/city_widget.dart';
import 'package:flutter_base/ui/addcity/components/search_bar_widget.dart';
import 'package:flutter_base/ui/base/base_page_widget.dart';
import 'package:flutter_base/ui/base/status.dart';

class AddCityWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCityWidgetState();
  }
}

class _AddCityWidgetState
    extends BasePageState<AddCityWidget, AddCityCubit, AddCityData> {
  FocusNode _searchFocusNode = FocusNode();

  @override
  void onViewCreated() {
    super.onViewCreated();
    _searchFocusNode.requestFocus();
  }

  @override
  void onDataChange(BuildContext context, AddCityData data) {
    super.onDataChange(context, data);
    final status = data.status;
    if (status is Completed) {
      Navigator.of(context).pop();
    } else if (status is Error) {
      showSnackMessage(status.error.message);
    }
  }

  @override
  Widget buildPage(BuildContext context, AddCityData data) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64),
          Container(
            child: SearchBarWidget(
              onSearch: cubit.searchCity,
              focusNode: _searchFocusNode,
              loading: data.status is Loading,
            ),
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
            child: _buildCities(data),
          )
        ],
      ),
    );
  }

  Widget _buildCities(AddCityData data) {
    final cities = data.cities ?? [];
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
