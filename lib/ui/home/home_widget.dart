import 'package:flutter/material.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/ui/addcity/add_city_widget.dart';
import 'package:flutter_base/ui/home/home_cubit.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeCubit _cubit = getIt.get();

  @override
  Widget build(BuildContext context) {
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
      body: Container(),
    );
  }
}
