import 'package:flutter/material.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/ui/base/base_page_widget.dart';
import 'package:flutter_base/ui/citydetails/city_details_cubit.dart';
import 'package:flutter_base/ui/citydetails/city_details_data.dart';
import 'package:flutter_base/data/models/weather_city.dart';

class CityDetailsWidget extends StatefulWidget {
  final CityDetailsArg arg;

  CityDetailsWidget({required this.arg});

  @override
  State<StatefulWidget> createState() {
    return _CityDetailsWidgetState();
  }
}

class _CityDetailsWidgetState extends BasePageState<CityDetailsWidget,
    CityDetailsCubit, CityDetailsData> {
  @override
  void onViewCreated() {
    super.onViewCreated();
    cubit.getWeatherByCity(widget.arg.city);
    cubit.getWeatherByCityId(widget.arg.cityId);
  }

  @override
  Widget buildPage(BuildContext context, CityDetailsData data) {
    return Scaffold(
      body: _buildContent(data),
    );
  }

  Widget _buildContent(CityDetailsData data) {
    final WeatherCity? weatherCity = data.weather;
    if (weatherCity == null) return Container();

    final City city = weatherCity.city;
    final Weather weather = weatherCity.weather;

    final List<WeatherInfo> weatherInfo = weatherCity.weather.weathers ?? [];
    String iconUrl = '';
    if (weatherInfo.isNotEmpty) {
      iconUrl = weatherInfo[0].getWeatherIconUrl();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 130),
          Image.network(iconUrl, height: 80, width: 80),
          SizedBox(height: 16),
          Text(
            city.getFullName(),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 24),
          Text(
            "Temperature: ${weather.main?.temp ?? 0} Fahrenheit",
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(height: 16),
          Text(
            "Pressure: ${weather.main?.pressure ?? 0} Hg",
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(height: 16),
          Text(
            "Humidity: ${weather.main?.humidity ?? 0} %",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class CityDetailsArg {
  final City? city;
  final int? cityId;

  CityDetailsArg({
    this.city,
    this.cityId,
  });

  factory CityDetailsArg.from(dynamic args) {
    if (args is City) {
      return CityDetailsArg(city: args);
    }
    if (args is Map<String, String>) {
      int? cityId = int.tryParse(args["cityId"] ?? '');
      return CityDetailsArg(cityId: cityId);
    }
    return CityDetailsArg();
  }
}
