import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
import 'package:flutter_base_core_module_1/data/repo/weather_core_repo.dart';
import 'package:flutter_base_core_module_1/di/di.dart';
import 'package:flutter_base_core_module_1/manager/weather_manager.dart';
import 'package:flutter_base_config/data/core_repo.dart';

class WeatherCoreScreen extends StatefulWidget {
  const WeatherCoreScreen({Key? key}) : super(key: key);

  @override
  State<WeatherCoreScreen> createState() => _WeatherCoreScreenState();
}

class _WeatherCoreScreenState extends State<WeatherCoreScreen> {
  final weatherManager = getItCoreModule!<WeatherManager>();
  final coreRepo = getItCoreModule!<CoreRepo>();
  final coreModuleRepo = getItCoreModule!<WeatherCoreRepo>();

  WeatherCoreModel? weatherCoreModel;
  String flavor = '';
  int historyLength = 0;

  StreamSubscription? _streamSubscription1;
  StreamSubscription? _streamSubscription2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _streamSubscription1 = weatherManager.weatherStateSubject.listen((value) {
        try {
          weatherCoreModel = weatherManager.getWeatherInfo();
          setState(() {
            if (weatherCoreModel != null && weatherCoreModel!.id % 2 != 0) {
              weatherCoreModel!.id = DateTime.now().millisecondsSinceEpoch;
              coreModuleRepo.saveLastCity(weatherCoreModel!);
            }
          });
        } catch (e) {
          // ignore
        }
      });
      _getRemoteConfig();
      _streamSubscription2 = coreModuleRepo.getWeathers().listen((event) {
        historyLength = event.length;
        setState(() {});
      });
    });
  }

  _getRemoteConfig() async {
    flavor = await coreRepo.getRemoteFlavor();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather core screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('history length >> $historyLength'),
            Text(flavor),
            const SizedBox(height: 12),
            Text(
              '${weatherCoreModel?.location}\n${weatherCoreModel?.status}\n${weatherCoreModel?.temp}',
            ),
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
