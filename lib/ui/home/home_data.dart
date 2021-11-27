import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/ui/base/base_data.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/common/models.dart';

part 'home_data.g.dart';

@CopyWith()
class HomeData extends BaseData {
  final List<City>? cities;
  final List<WeatherCity>? weathers;

  HomeData({
    Status? status,
    this.cities,
    this.weathers,
  }) : super(status ?? Init());
}
