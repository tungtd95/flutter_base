import 'package:flutter_base/data/local/pref.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/data/models/weather_city.dart';
import 'package:flutter_base/ui/home/home_data.dart';
import 'package:flutter_base_core_module_1/manager/weather_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/src/transformers/backpressure/debounce.dart';
import 'package:flutter_base_config/data/core_repo.dart';

@injectable
class HomeCubit extends BaseCubit<HomeData> {
  WeatherRepo _weatherRepo;
  CoreRepo _coreRepo;
  Pref _pref;
  ErrorHandler _errorHandler;
  WeatherManager _weatherManager;

  HomeCubit({
    required WeatherRepo weatherRepo,
    required Pref pref,
    required ErrorHandler errorHandler,
    required WeatherManager weatherManager,
    required CoreRepo coreRepo,
  })  : this._weatherRepo = weatherRepo,
        this._pref = pref,
        this._errorHandler = errorHandler,
        this._weatherManager = weatherManager,
        this._coreRepo = coreRepo,
        super(HomeData());

  void subscribeCitiesStream() {
    _weatherRepo
        .getCitiesStream()
        .debounceTime(Duration(milliseconds: 500))
        .listen((event) => _getWeathers(event));
    _weatherManager.weatherStateSubject.listen((value) {
      print('weather state subject ${value.name}');
    });
  }

  void _getWeathers(List<City> cities) async {
    if (cities.isEmpty) {
      emit(state.copyWith(
        weathers: null,
        status: Success(),
      ));
      return;
    }
    emit(state.copyWith(
      cities: cities,
      status: Loading(),
    ));
    final List<WeatherCity> weathers = [];
    var error;
    for (var i = 0; i < cities.length; i++) {
      Weather? weather;
      await _weatherRepo.getWeatherByCity(cities[i]).then(
        (value) {
          weather = value;
        },
        onError: (e) {
          error = e;
        },
      );
      if (weather != null) {
        weathers.add(WeatherCity(city: cities[i], weather: weather!));
      }
    }
    emit(state.copyWith(
      weathers: weathers,
      status: error != null ? Error(_errorHandler.parse(error)) : Success(),
    ));
  }

  void refreshWeathers() {
    _getWeathers(state.cities ?? []);
    checkRemoteFlavor();
  }

  void removeCity(City city) {
    final List<City> currentCities = List.from(state.cities ?? []);
    final List<WeatherCity> currentWeathers = List.from(state.weathers ?? []);
    currentCities.remove(city);
    currentWeathers.removeWhere((element) => element.city == city);
    emit(state.copyWith(cities: currentCities, weathers: currentWeathers));
    _weatherRepo.removeCity(city);
  }

  bool checkFirstTimeStartUp() {
    return _pref.isFirstTimeStartUp();
  }

  void markFirstTimeStartUp() {
    _pref.markFirstTimeStartUp();
  }

  void checkRemoteFlavor() {
    _coreRepo.getRemoteFlavor().then((value) {
      emit(state.copyWith(remoteFlavor: value));
    }, onError: (e) {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
