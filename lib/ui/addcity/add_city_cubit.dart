import 'dart:async';

import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/ui/addcity/add_city_state.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/screen_state.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddCityCubit extends BaseCubit<AddCityState> {
  WeatherRepo _weatherRepo;
  final _queryController = StreamController<String>();

  AddCityCubit({required WeatherRepo weatherRepo})
      : _weatherRepo = weatherRepo,
        super(AddCityState()) {
    _queryController.stream
        .debounce((_) => TimerStream(true, Duration(milliseconds: 300)))
        .listen(_searchCity);
  }

  void searchCity(String query) {
    if (query.length <= 1) {
      emit(state.copyWith(cities: []));
      return;
    }
    _queryController.add(query);
  }

  void _searchCity(String query) {
    emit(state.copyWith(screenState: ScreenState.loading()));
    _weatherRepo.searchCitiesByName(query).then((cities) {
      emit(state.copyWith(
        cities: cities,
        screenState: ScreenState.success(),
      ));
    }, onError: (e) {
      // TODO: handle error
      emit(state.copyWith(screenState: ScreenState.error()));
    });
  }

  void addCityToFav(City city) {
    _weatherRepo.addCity(city).then(
      (value) {
        emit(state.copyWith(screenState: ScreenState.completed()));
      },
      onError: (e) {},
    );
  }

  @override
  void dispose() {
    _queryController.close();
  }
}
