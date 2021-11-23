import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/common/models.dart';
import 'package:flutter_base/ui/home/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  WeatherRepo _weatherRepo;

  HomeCubit({required WeatherRepo weatherRepo})
      : this._weatherRepo = weatherRepo,
        super(HomeState());

  void subscribeCitiesStream() {
    _weatherRepo.getCitiesStream().listen(
      (event) {
        emit(state.copyWith(cities: event));
        _getWeathers(event);
      },
      onError: (e) {},
    );
  }

  void _getWeathers(List<City> cities) async {
    if (cities.isEmpty) {
      emit(state.copyWith(weathers: null));
      return;
    }
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
    emit(state.copyWith(weathers: weathers));
  }

  void removeCity(City city) {
    final List<City> currentCities = List.from(state.cities ?? []);
    final List<WeatherCity> currentWeathers = List.from(state.weathers ?? []);
    currentCities.remove(city);
    currentWeathers.removeWhere((element) => element.city == city);
    emit(state.copyWith(cities: currentCities, weathers: currentWeathers));
    _weatherRepo.removeCity(city);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
