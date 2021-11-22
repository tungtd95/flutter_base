import 'package:flutter_base/data/repo/weather_repo.dart';
import 'package:flutter_base/ui/base/base_cubit.dart';
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
      },
      onError: (e) {},
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
