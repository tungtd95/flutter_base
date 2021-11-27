import 'dart:async';

import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/ui/addcity/add_city_data.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddCityCubit extends BaseCubit<AddCityData> {
  WeatherRepo _weatherRepo;
  ErrorHandler _errorHandler;
  final _queryController = StreamController<String>();

  AddCityCubit({
    required WeatherRepo weatherRepo,
    required ErrorHandler errorHandler,
  })  : this._weatherRepo = weatherRepo,
        this._errorHandler = errorHandler,
        super(AddCityData()) {
    _queryController.stream
        .debounce((_) => TimerStream(true, Duration(milliseconds: 300)))
        .listen(_searchCity);
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
  }
}
