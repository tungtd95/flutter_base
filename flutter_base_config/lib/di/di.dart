import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureBaseConfigDependencies({
  required GetIt getIt,
  required String env,
}) async {
  $initGetIt(getIt, environment: env);
}
