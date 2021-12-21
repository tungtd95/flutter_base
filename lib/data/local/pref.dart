import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class Pref {
  // const
  final String _FIRST_TIME_STARTUP = "FIRST_TIME_STARTUP";

  SharedPreferences _sharedPreferences;

  Pref({required SharedPreferences sharedPreferences})
      : this._sharedPreferences = sharedPreferences;

  bool isFirstTimeStartUp() {
    return _sharedPreferences.getBool(_FIRST_TIME_STARTUP) ?? true;
  }

  void markFirstTimeStartUp() {
    _sharedPreferences.setBool(_FIRST_TIME_STARTUP, false);
  }
}
