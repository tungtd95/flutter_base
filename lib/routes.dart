import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/ui/sample/addcity/add_city_widget.dart';
import 'package:flutter_base/ui/sample/citydetails/city_details_widget.dart';
import 'package:flutter_base/ui/common/not_found_widget.dart';
import 'package:flutter_base/ui/common/splash_widget.dart';
import 'package:flutter_base/ui/home/home_widget.dart';
import 'package:flutter_base/utils/common_utils.dart';

class Routes {
  static const String SCHEME = "sekiro";
  static const String DOMAIN = "$SCHEME://weather.sekiro.com";

  static const String HOME = "";
  static const String CITY_DETAIL = "/city";
  static const String ADD_CITY = "/add_city";
  static const String SPLASH = "/splash";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final deepLink = DeepLinkParser.parse(settings.name ?? HOME);
    dynamic args = deepLink.args ?? settings.arguments;
    String path = deepLink.path;

    Widget page;

    switch (path) {
      case HOME:
        page = HomeWidget();
        break;
      case CITY_DETAIL:
        page = CityDetailsWidget(arg: CityDetailsArg.from(args));
        break;
      case ADD_CITY:
        page = AddCityWidget();
        break;
      case SPLASH:
        page = SplashWidget();
        break;
      default:
        page = NotFoundWidget();
    }

    return MaterialPageRoute(builder: (context) {
      return page;
    });
  }
}
