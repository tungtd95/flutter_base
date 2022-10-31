import 'package:flutter/material.dart';
import 'package:flutter_base_core_module_1/data/models/weather_core_model.dart';
import 'package:flutter_base_core_module_1/manager/weather_manager.dart';
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

  WeatherCoreModel? weatherCoreModel;
  String flavor = '';

  _getRemoteConfig() async {
    flavor = await coreRepo.getRemoteFlavor();
    setState(() {});
  }

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
            Text(
              '${weatherCoreModel?.location}\n${weatherCoreModel?.status}\n${weatherCoreModel?.temp}',
            ),
            const SizedBox(height: 12),
            Text(flavor),
          ],
        ),
      ),
    );
  }
}
