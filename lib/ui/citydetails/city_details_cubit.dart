import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
import 'package:flutter_base/ui/citydetails/city_details_state.dart';
import 'package:flutter_base/ui/common/models.dart';
import 'package:injectable/injectable.dart';

@injectable
class CityDetailsCubit extends BaseCubit<CityDetailsState> {
  WeatherRepo _weatherRepo;

  CityDetailsCubit({required WeatherRepo weatherRepo})
      : this._weatherRepo = weatherRepo,
        super(CityDetailsState());

  void getWeatherByCity(City city) {
    _weatherRepo.getWeatherByCity(city).then(
      (value) {
        emit(state.copyWith(weather: WeatherCity(city: city, weather: value)));
      },
      onError: (e) {},
    );
  }

  void getWeatherByCityId(int cityId) {}

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
