import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/citydetails/city_details_state.dart';
import 'package:flutter_base/ui/common/models.dart';
import 'package:injectable/injectable.dart';

@injectable
class CityDetailsCubit extends BaseCubit<CityDetailsState> {
  WeatherRepo _weatherRepo;
  ErrorHandler _errorHandler;

  CityDetailsCubit({
    required WeatherRepo weatherRepo,
    required ErrorHandler errorHandler,
  })  : this._weatherRepo = weatherRepo,
        this._errorHandler = errorHandler,
        super(CityDetailsState());

  void getWeatherByCity(City city) {
    _weatherRepo.getWeatherByCity(city).then(
      (value) {
        emit(state.copyWith(weather: WeatherCity(city: city, weather: value)));
      },
      onError: (e) {
        emit(state.copyWith(status: Status.error(_errorHandler.parse(e))));
      },
    );
  }

  void getWeatherByCityId(int cityId) {}

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
