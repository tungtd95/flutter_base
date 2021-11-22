import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/ui/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  WeatherRepo _weatherRepo;

  HomeCubit({required WeatherRepo weatherRepo})
      : this._weatherRepo = weatherRepo,
        super(HomeState());

  void subscribeCitiesStream() {
    _weatherRepo.getCitiesStream().listen(
      (event) {
        emit(state.copyWith(cities: event));
      },
      onError: (e) {},
    );
  }
}
