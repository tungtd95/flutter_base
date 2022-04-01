import 'package:flutter/material.dart';
import 'package:flutter_base/ui/sample/addcity/add_city_cubit.dart';
import 'package:flutter_base/ui/sample/addcity/add_city_data.dart';
import 'package:flutter_base/ui/sample/addcity/components/city_widget.dart';
import 'package:flutter_base/ui/sample/addcity/components/search_bar_widget.dart';
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
    cubit.subscribeAllTickerStream();
    cubit.subscribeBTCStream();
  }

  @override
  void onDataChange(BuildContext context, AddCityData data) {
    super.onDataChange(context, data);
    final status = data.status;
    if (status is Completed) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: blocBuilder(
        builder: (context, data) {
          return Column(
            children: [
              SizedBox(height: 64),
              Container(
                child: SearchBarWidget(
                  onSearch: cubit.searchCity,
                  focusNode: _searchFocusNode,
                  loading: data.status.isLoading(),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('BTC Price:\n${DateTime.now()}\n${data.btcCandle?.close}'),
              ),
              Expanded(
                child: _buildCities(data),
              )
            ],
          );
        },
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
