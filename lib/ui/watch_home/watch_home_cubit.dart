import 'dart:async';
import 'dart:convert';

import 'package:flutter_base/data/models/weather_city.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/watch_home/watch_home_data.dart';
import 'package:injectable/injectable.dart';
import 'package:watch_connectivity/watch_connectivity.dart';

@injectable
class WatchHomeCubit extends BaseCubit<WatchHomeData> {
  ErrorHandler _errorHandler;
  final _watch = WatchConnectivity();
  StreamSubscription? contextSub;
  StreamSubscription? msgSub;

  WatchHomeCubit({
    required ErrorHandler errorHandler,
  })  : this._errorHandler = errorHandler,
        super(WatchHomeData()) {
    checkWatch();
  }

  checkWatch() async {
    final isPaired = await _watch.isPaired;
    final isReachable = await _watch.isReachable;
    final isSupported = await _watch.isSupported;
    print("isPaired $isPaired");
    print("isReachable $isReachable");
    print("isSupported $isSupported");

    contextSub = _watch.contextStream.listen((event) {
      print('contextStream: ${event}');
    });
    msgSub = _watch.messageStream.listen((event) {
      print('messageStream: ${event}');
      if (event.isEmpty) {
        emit(state.copyWith(
          weather: null,
          status: Success(),
        ));
      } else {
        final weatherCity = WeatherCity.fromJson(jsonDecode(jsonEncode(event)));
        emit(state.copyWith(
          weather: weatherCity,
          status: Success(),
        ));
      }
    });
  }

  @override
  void dispose() {
    contextSub?.cancel();
    msgSub?.cancel();
  }
}
