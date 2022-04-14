import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/repo/ticker_repo.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/ui/sample/addcity/add_city_data.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddCityCubit extends BaseCubit<AddCityData> {
  WeatherRepo _weatherRepo;
  ErrorHandler _errorHandler;
  TickerRepo _tickerRepo;

  final _queryController = StreamController<String>();
  StreamSubscription? _streamSubscription;
  StreamSubscription? _btcSubscription;

  AddCityCubit({
    required WeatherRepo weatherRepo,
    required ErrorHandler errorHandler,
    required TickerRepo tickerRepo,
  })  : this._weatherRepo = weatherRepo,
        this._errorHandler = errorHandler,
        _tickerRepo = tickerRepo,
        super(AddCityData()) {
    _queryController.stream
        .debounce((_) => TimerStream(true, Duration(milliseconds: 300)))
        .listen(_searchCity);
  }

  void subscribeAllTickerStream() {
    _streamSubscription = _tickerRepo.allTickerStream.listen((event) {
      print("${DateTime.now()} >> $runtimeType >> 24hTicker >> event = $event");
    });
  }

  void subscribeBTCStream() {
    _btcSubscription = _tickerRepo.getCandle('CAKEBUSD').listen((event) {
      debugPrint('$runtimeType price of CAKEBUSD ${event.open}');
    });
  }

  void searchCity(String query) {
    if (query.length <= 1) {
      emit(state.copyWith(cities: [], status: Init()));
      return;
    }
    _queryController.add(query);
  }

  void _searchCity(String query) {
    emit(state.copyWith(status: Loading()));
    _weatherRepo.searchCitiesByName(query).then((cities) {
      emit(state.copyWith(
        cities: cities,
        status: Success(),
      ));
    }, onError: (e) {
      emit(state.copyWith(status: Error(_errorHandler.parse(e))));
    });
  }

  void addCityToFav(City city) {
    _weatherRepo.addCity(city).then(
      (value) {
        emit(state.copyWith(status: Completed()));
      },
      onError: (e) {},
    );
  }

  @override
  void dispose() {
    _queryController.close();
    _streamSubscription?.cancel();
    _btcSubscription?.cancel();
  }
}
