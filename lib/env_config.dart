import 'package:injectable/injectable.dart';

abstract class Env {
  String get weatherUrl;

  String get weatherAppID;

  String get socketIOUrl;
}

@Injectable(as: Env, env: [Environment.dev])
class EnvDEV extends Env {
  @override
  String get weatherUrl => 'https://api.openweathermap.org';

  @override
  String get weatherAppID => '1f930c31692eff97a92281d72455c44a';

  @override
  String get socketIOUrl => 'wss://ws-qc.nonprodposi.com/';
}

@Injectable(as: Env, env: [Environment.prod])
class EnvPROD extends Env {
  @override
  String get weatherUrl => 'https://api.openweathermap.org';

  @override
  String get weatherAppID => '1f930c31692eff97a92281d72455c44a';

  @override
  String get socketIOUrl => 'wss://ws-qc.nonprodposi.com/';
}
