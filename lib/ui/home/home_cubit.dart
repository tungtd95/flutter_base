import 'package:flutter_base/data/local/pref.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/screen_state.dart';
import 'package:flutter_base/ui/common/models.dart';
import 'package:flutter_base/ui/home/home_state.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/src/transformers/backpressure/debounce.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  WeatherRepo _weatherRepo;
  Pref _pref;

  HomeCubit({required WeatherRepo weatherRepo, required Pref pref})
      : this._weatherRepo = weatherRepo,
        this._pref = pref,
        super(HomeState());

  void subscribeCitiesStream() {
    _weatherRepo
        .getCitiesStream()
        .debounceTime(Duration(milliseconds: 500))
        .listen((event) => _getWeathers(event));
  }

  void _getWeathers(List<City> cities) async {
    if (cities.isEmpty) {
      emit(state.copyWith(
        weathers: null,
        screenState: ScreenState.success(),
      ));
      return;
    }
    emit(state.copyWith(
      cities: cities,
      screenState: ScreenState.loading(),
    ));
    final List<WeatherCity> weathers = [];
    for (var i = 0; i < cities.length; i++) {
      Weather? weather;
      await _weatherRepo.getWeatherByCity(cities[i]).then(
        (value) {
          weather = value;
        },
        onError: (e) {},
      );
      if (weather != null) {
        weathers.add(WeatherCity(city: cities[i], weather: weather!));
      }
    }
    emit(state.copyWith(
      weathers: weathers,
      screenState: ScreenState.success(),
    ));
  }

  void refreshWeathers() {
    _getWeathers(state.cities ?? []);
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

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
