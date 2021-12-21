import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/ui/base/base_data.dart';
import 'package:flutter_base/ui/base/status.dart';

part 'add_city_data.g.dart';

@CopyWith()
class AddCityData extends BaseData {
  List<City>? cities;

  AddCityData({
    Status? status,
    this.cities,
  }) : super(status ?? Init());
}
