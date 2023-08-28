import 'package:flutter/material.dart';
import 'package:flutter_base/ui/base/base_page_widget.dart';
import 'package:flutter_base/ui/home/components/weather_widget.dart';
import 'package:flutter_base/ui/watch_home/watch_home_cubit.dart';
import 'package:flutter_base/ui/watch_home/watch_home_data.dart';

class WatchHomeWidget extends StatefulWidget {
  const WatchHomeWidget({super.key});

  @override
  State<WatchHomeWidget> createState() => _WatchHomeWidgetState();
}

class _WatchHomeWidgetState
    extends BasePageState<WatchHomeWidget, WatchHomeCubit, WatchHomeData> {
  @override
  void onViewCreated() {
    super.onViewCreated();
  }

  @override
  void onDataChange(BuildContext context, WatchHomeData data) {
    super.onDataChange(context, data);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: blocBuilder(builder: (context, data) {
        final weather = data.weather;
        if (weather == null) {
          return Center(
            child: Text('Add a city on your phone'),
          );
        }
        return WeatherWidget(
          city: weather.city,
          weather: weather.weather,
          isWear: true,
        );
      }),
    );
  }
}
