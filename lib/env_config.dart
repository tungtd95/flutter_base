import 'package:injectable/injectable.dart';

abstract class Env {
  String getOpenWeatherUrl();

  String getOpenWeatherAppID();
}

@Injectable(as: Env, env: [Environment.dev])
class EnvDEV extends Env {
  @override
  String getOpenWeatherUrl() => "https://api.openweathermap.org";

  @override
  String getOpenWeatherAppID() => "1f930c31692eff97a92281d72455c44a";
}

@Injectable(as: Env, env: [Environment.prod])
class EnvPROD extends Env {
  @override
  String getOpenWeatherUrl() => "https://api.openweathermap.org/prod";

  @override
  String getOpenWeatherAppID() => "1f930c31692eff97a92281d72455c44a-prod";
}
