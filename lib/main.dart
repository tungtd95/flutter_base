import 'package:flutter/material.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/routes.dart';
import 'package:flutter_base/ui/home/home_widget.dart';
import 'package:injectable/injectable.dart';

const env = String.fromEnvironment("Env", defaultValue: Environment.dev);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(env: env);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(),
      navigatorObservers: [getIt<RouteObserver<ModalRoute<void>>>()],
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
