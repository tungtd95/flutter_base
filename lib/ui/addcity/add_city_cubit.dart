import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/ui/addcity/add_city_state.dart';
import 'package:flutter_base/ui/base/screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCityCubit extends Cubit<AddCityState> {
  WeatherRepo weatherRepo;

  AddCityCubit({required this.weatherRepo}) : super(AddCityState());

  void searchCity(String query) {
    weatherRepo.searchCitiesByName(query).then(
      (cities) {
        emit(
          state.copyWith(
            cities: cities,
            screenState: ScreenState.success(),
          ),
        );
      },
      onError: (e) {},
    );
  }
}
