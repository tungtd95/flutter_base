import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_base/ui/base/base_data.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/data/models/weather_city.dart';

part 'watch_home_data.g.dart';

@CopyWith()
class WatchHomeData extends BaseData {
  final WeatherCity? weather;

  WatchHomeData({
    Status? status,
    this.weather,
  }) : super(status ?? Init());
}
