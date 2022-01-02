import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sorting_native/sorting_native.dart';

class SortingNativeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SortingNativeWidgetState();
  }
}

class _SortingNativeWidgetState extends State {
  List<int> sorted = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      List<int> randomList = [];
      for (var i = 0; i < 20; i++) {
        randomList.add(Random().nextInt(40));
      }
      sorted = await SortingNative.sort(randomList);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          sorted.join(' '),
        ),
      ),
    );
  }
}
