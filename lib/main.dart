import 'package:flutter/material.dart';
import 'package:flutter_base/di/data_module.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/l10n/l10n.dart';
import 'package:flutter_base/routes.dart';
import 'package:flutter_base/ui/home/home_widget.dart';
import 'package:flutter_base_config/utils/notification_utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:overlay_support/overlay_support.dart';

const env = String.fromEnvironment("Env", defaultValue: Environment.dev);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(env: env);
  NotificationUtils.handleNotificationAppLaunch();

  runApp(const MyApp());
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
