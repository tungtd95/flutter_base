import 'package:flutter/material.dart';
import 'package:flutter_base/routes.dart';
import 'package:flutter_base/ui/base/base_page_widget.dart';
import 'package:flutter_base/ui/home/components/weather_widget.dart';
import 'package:flutter_base/ui/home/home_cubit.dart';
import 'package:flutter_base/ui/home/home_data.dart';
import 'package:flutter_base/ui/sample/learn/learn_entry_widget.dart';
import 'package:flutter_base/utils/notification_utils.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
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
  String log = '';

  @override
  void onViewCreated() async {
    super.onViewCreated();
    cubit.subscribeCitiesStream();
    cubit.checkRemoteFlavor();
    if (cubit.checkFirstTimeStartUp()) {
      cubit.markFirstTimeStartUp();
      Navigator.of(context).pushNamed(Routes.SPLASH);
    }
    NotificationUtils.subscribePayload(context);
    initIAP();
  }

  void initIAP() async {
    await FlutterInappPurchase.instance.initialize();
    final result = await FlutterInappPurchase.instance.getPurchaseHistory();
    log += 'purchase history length: ${result?.length}\n';
    result?.forEach((element) {
      log += "${element.productId} >> ${element.transactionDate}\n";
    });
    setState(() {});
  }

  @override
  void onDataChange(BuildContext context, HomeData data) {
    super.onDataChange(context, data);
    if (!data.status.isLoading()) {
      _refreshController.refreshCompleted();
    }
  }

  @override
  Widget buildPage(BuildContext context) {
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
              child: _buildContent(),
            ),
            Container(
              margin: EdgeInsets.only(left: 24, bottom: 8),
              child: Text(
                log,
                style: TextStyle(
                  color: Colors.black45,
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return LearnEntryWidget();
                    },
                  ),
                );
              },
              child: Container(
                child: blocBuilder(
                  builder: (context, data) {
                    return Text(
                      "Remote Flavor: ${data.remoteFlavor}",
                      style: TextStyle(
                        color: Colors.black45,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
                margin: EdgeInsets.only(left: 24, bottom: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return blocBuilder(
      builder: (context, data) {
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
      },
    );
  }

  @override
  void dispose() {
    NotificationUtils.clear();
    super.dispose();
  }
}
