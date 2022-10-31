import 'package:flutter/material.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
import 'package:flutter_base_core_module_1/di/di.dart';
import 'package:flutter_base_core_module_1/manager/weather_manager.dart';

class WeatherCoreScreen extends StatefulWidget {
  const WeatherCoreScreen({Key? key}) : super(key: key);

  @override
  State<WeatherCoreScreen> createState() => _WeatherCoreScreenState();
}

class _WeatherCoreScreenState extends State<WeatherCoreScreen> {
  final weatherManager = getItCoreModule!<WeatherManager>();
  WeatherCoreModel? weatherCoreModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      weatherManager.weatherStateSubject.listen((value) {
        try {
          weatherCoreModel = weatherManager.getWeatherInfo();
          setState(() {});
        } catch (e) {
          // ignore
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather core screen'),
      ),
      body: Center(
        child: Text(
          '${weatherCoreModel?.location}\n${weatherCoreModel?.status}\n${weatherCoreModel?.temp}',
        ),
      ),
    );
  }
}
