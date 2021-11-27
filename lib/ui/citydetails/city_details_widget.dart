import 'package:flutter/material.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/ui/base/base_page_widget.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/citydetails/city_details_cubit.dart';
import 'package:flutter_base/ui/citydetails/city_details_state.dart';
import 'package:flutter_base/ui/common/models.dart';

class CityDetailsWidget extends StatefulWidget {
  final City city;

  CityDetailsWidget({required this.city});

  @override
  State<StatefulWidget> createState() {
    return _CityDetailsWidgetState();
  }
}

class _CityDetailsWidgetState extends BasePageState<CityDetailsWidget,
    CityDetailsCubit, CityDetailsState> {
  @override
  void onViewCreated() {
    super.onViewCreated();
    cubit.getWeatherByCity(widget.city);
  }

  @override
  void onStateChange(BuildContext context, CityDetailsState state) {
    super.onStateChange(context, state);
    final status = state.status;
    if (status is Error) {
      showSnackMessage(status.error.message);
    }
  }

  @override
  Widget buildPage(BuildContext context, CityDetailsState state) {
    return Scaffold(
      body: _buildContent(state),
    );
  }

  Widget _buildContent(CityDetailsState state) {
    final WeatherCity? weatherCity = state.weather;
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
