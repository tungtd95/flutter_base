import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/sample/citydetails/city_details_data.dart';
import 'package:flutter_base/data/models/weather_city.dart';
import 'package:injectable/injectable.dart';

@injectable
class CityDetailsCubit extends BaseCubit<CityDetailsData> {
  WeatherRepo _weatherRepo;
  ErrorHandler _errorHandler;

  CityDetailsCubit({
    required WeatherRepo weatherRepo,
    required ErrorHandler errorHandler,
  })  : this._weatherRepo = weatherRepo,
        this._errorHandler = errorHandler,
        super(CityDetailsData());

  void getWeatherByCity(City? city) {
    if (city == null) return;
    _weatherRepo.getWeatherByCity(city).then(
      (value) {
        emit(state.copyWith(weather: WeatherCity(city: city, weather: value)));
      },
      onError: (e) {
        emit(state.copyWith(status: Error(_errorHandler.parse(e))));
      },
    );
  }

  void getWeatherByCityId(int? cityId) {
    if (cityId == null) return;
    _weatherRepo.getWeatherByCityId(cityId).then(
      (value) {
        emit(state.copyWith(weather: value, status: Success()));
      },
      onError: (e) {
        emit(state.copyWith(status: Error(_errorHandler.parse(e))));
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
