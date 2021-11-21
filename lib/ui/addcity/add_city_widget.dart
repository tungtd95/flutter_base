import 'package:flutter/material.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/ui/addcity/add_city_cubit.dart';
import 'package:flutter_base/ui/addcity/add_city_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64),
          Container(
            child: SearchBarWidget(onSearch: _cubit.searchCity),
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
          SizedBox(height: 24),
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
        return Center(
          child: Text("Cities: ${state.cities?.map((e) => e.name).join(", ")}"),
        );
      },
    );
  }
}
