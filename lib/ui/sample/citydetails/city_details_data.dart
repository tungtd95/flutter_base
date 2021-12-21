import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_base/ui/base/base_data.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/data/models/weather_city.dart';

part 'city_details_data.g.dart';

@CopyWith()
class CityDetailsData extends BaseData {
  WeatherCity? weather;

  CityDetailsData({
    Status? status,
    this.weather,
  }) : super(status ?? Init());
}
