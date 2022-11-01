import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
import 'package:flutter_base_core_module_1/manager/weather_manager.dart';
import 'package:flutter_base_module_1/data/models/weather_module_1_model.dart';
import 'package:flutter_base_module_1/data/repo/weather_module_1_repo.dart';
import 'package:flutter_base_module_1/di/di.dart';
import 'package:flutter_base_config/data/core_repo.dart';

class FlutterBaseModule1Screen extends StatefulWidget {
  const FlutterBaseModule1Screen({Key? key}) : super(key: key);

  @override
  State<FlutterBaseModule1Screen> createState() =>
      _FlutterBaseModule1ScreenState();
}

class _FlutterBaseModule1ScreenState extends State<FlutterBaseModule1Screen> {
  final weatherManager = getItModule1!<WeatherManager>();
  final coreRepo = getItModule1!<CoreRepo>();
  final weatherModule1Repo = getItModule1!<WeatherModule1Repo>();

  WeatherCoreModel? weatherCoreModel;
  String flavor = '';
  int historyLength = 0;
  List<WeatherModule1Model> weathers = [];

  StreamSubscription? _streamSubscription1;
  StreamSubscription? _streamSubscription2;

  _getRemoteConfig() async {
    flavor = await coreRepo.getRemoteFlavor();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _streamSubscription1 = weatherManager.weatherStateSubject.listen((value) {
        try {
          weatherCoreModel = weatherManager.getWeatherInfo();
          if (weatherCoreModel != null) {
            // weatherModule1Repo.saveWeather(
            //   WeatherModule1Model.fromCore(weatherCoreModel!),
            // );
          }
          setState(() {});
        } catch (e) {
          // ignore
        }
      });
      _getRemoteConfig();

      _streamSubscription2 = weatherModule1Repo.getWeathers().listen((event) {
        historyLength = event.length;
        weathers = event;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather module 1 screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final weather = weathers[index];
                  return ListTile(
                    key: ValueKey(weather.id),
                    title: Text(weather.location),
                    subtitle: Text(
                      '${weather.status} - temp: ${weather.temp} - humi: ${weather.humidity}',
                    ),
                  );
                },
                itemCount: weathers.length,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${weatherCoreModel?.location}\n${weatherCoreModel?.status}\n${weatherCoreModel?.temp}',
            ),
            const SizedBox(height: 12),
            Text(flavor),
            Text('history length = $historyLength'),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _streamSubscription1?.cancel();
    _streamSubscription2?.cancel();
    super.dispose();
  }
}
