import 'package:flutter/material.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
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

  WeatherCoreModel? weatherCoreModel;
  String flavor = '';

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
      _getRemoteConfig();
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
}
