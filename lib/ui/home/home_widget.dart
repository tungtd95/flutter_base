import 'package:flutter/material.dart';
import 'package:flutter_base/ui/addcity/add_city_widget.dart';
import 'package:flutter_base/ui/base/base_page_widget.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/citydetails/city_details_widget.dart';
import 'package:flutter_base/ui/home/components/weather_widget.dart';
import 'package:flutter_base/ui/home/home_cubit.dart';
import 'package:flutter_base/ui/home/home_state.dart';
import 'package:flutter_base/ui/splash/splash_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends BasePageState<HomeWidget, HomeCubit, HomeState> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onViewCreated() {
    super.onViewCreated();
    cubit.subscribeCitiesStream();
    if (cubit.checkFirstTimeStartUp()) {
      cubit.markFirstTimeStartUp();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return SplashWidget();
      }));
    }
  }

  @override
  void onStateChange(BuildContext context, HomeState state) {
    super.onStateChange(context, state);
    if (!(state.status is Loading)) {
      _refreshController.refreshCompleted();
    }
  }

  @override
  Widget buildPage(BuildContext context, HomeState state) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AddCityWidget();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: _buildContent(state),
    );
  }

  Widget _buildContent(HomeState state) {
    final weathers = state.weathers ?? [];
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: cubit.refreshWeathers,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final weather = weathers[index];
          return WeatherWidget(
            city: weather.city,
            weather: weather.weather,
            onRemoved: () {
              cubit.removeCity(weather.city);
            },
            onSelected: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return CityDetailsWidget(city: weather.city);
                }),
              );
            },
          );
        },
        itemCount: weathers.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 4);
        },
        padding: EdgeInsets.symmetric(vertical: 64),
      ),
    );
  }
}
