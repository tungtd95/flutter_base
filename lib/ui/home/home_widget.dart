import 'package:flutter/material.dart';
import 'package:flutter_base/routes.dart';
import 'package:flutter_base/ui/base/base_page_widget.dart';
import 'package:flutter_base/ui/base/status.dart';
import 'package:flutter_base/ui/home/components/weather_widget.dart';
import 'package:flutter_base/ui/home/home_cubit.dart';
import 'package:flutter_base/ui/home/home_data.dart';
import 'package:flutter_base/utils/notification_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends BasePageState<HomeWidget, HomeCubit, HomeData> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onViewCreated() {
    super.onViewCreated();
    cubit.subscribeCitiesStream();
    cubit.checkRemoteFlavor();
    if (cubit.checkFirstTimeStartUp()) {
      cubit.markFirstTimeStartUp();
      Navigator.of(context).pushNamed(Routes.SPLASH);
    }
    NotificationUtils.subscribePayload(context);
  }

  @override
  void onDataChange(BuildContext context, HomeData data) {
    super.onDataChange(context, data);
    final status = data.status;
    if (!(status is Loading)) {
      _refreshController.refreshCompleted();
    }
  }

  @override
  Widget buildPage(BuildContext context, HomeData data) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.ADD_CITY);
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildContent(data),
            ),
            Container(
              child: Text("Flavor from firebase: ${data.remoteFlavor}"),
              margin: EdgeInsets.only(left: 30),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(HomeData data) {
    final weathers = data.weathers ?? [];
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
              Navigator.of(context).pushNamed(
                Routes.CITY_DETAIL,
                arguments: weather.city,
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

  @override
  void dispose() {
    NotificationUtils.clear();
    super.dispose();
  }
}
