import 'package:flutter/material.dart';
import 'package:flutter_base/di/data_module.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/l10n/l10n.dart';
import 'package:flutter_base/routes.dart';
import 'package:flutter_base/ui/home/home_widget.dart';
import 'package:flutter_base/ui/watch_home/watch_home_widget.dart';
import 'package:flutter_base/utils/firebase_utils.dart';
import 'package:flutter_base/utils/notification_utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:is_wear/is_wear.dart';

const env = String.fromEnvironment("Env", defaultValue: Environment.dev);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupFirebase();
  await configureDependencies(env: env);
  NotificationUtils.handleNotificationAppLaunch();

  final isWearPlugin = IsWear();
  final isWear = (await isWearPlugin.check()) ?? false;
  if (isWear) {
    runApp(const MyWatchApp());
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        localizationsDelegates: [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('vi', ''),
        ],
        localeListResolutionCallback: (locales, supportedLocales) {
          Locale? currentLocale = locales?.first;
          if (currentLocale == null) {
            return Locale('en', '');
          }
          bool isLocaleSupported = supportedLocales.any(
              (element) => element.languageCode == currentLocale.languageCode);
          if (isLocaleSupported) {
            return currentLocale;
          }
          return Locale('en', '');
        },
        home: HomeWidget(),
        navigatorKey: getIt<AliceWrapper>().alice?.getNavigatorKey(),
        navigatorObservers: [getIt<RouteObserver<ModalRoute<void>>>()],
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

class MyWatchApp extends StatelessWidget {
  const MyWatchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WatchHomeWidget(),
    );
  }
}
