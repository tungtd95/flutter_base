import 'dart:async';

import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/ui/addcity/add_city_state.dart';
import 'package:flutter_base/ui/base/screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddCityCubit extends Cubit<AddCityState> {
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
    _weatherRepo.searchCitiesByName(query).then((cities) {
      emit(state.copyWith(
        cities: cities,
        screenState: ScreenState.success(),
      ));
    }, onError: (e) {
      // TODO: handle error
    });
  }

  void dispose() {
    _queryController.close();
  }
}
