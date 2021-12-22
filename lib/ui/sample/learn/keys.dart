import 'dart:math';

import 'package:flutter/material.dart';

class KeyExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KeyExampleState();
  }
}

class _KeyExampleState extends State<KeyExample> {
  List<Widget> colors = [
    ColorStatefulWidget(key: UniqueKey()),
    ColorStatefulWidget(key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: colors,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.switch_left),
        onPressed: () {
          colors.add(colors.removeAt(0));
          setState(() {});
        },
      ),
    );
  }
}

class ColorStatelessWidget extends StatelessWidget {
  final Color color = randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Center(
        child: Text('$hashCode'),
      ),
    );
  }
}

class ColorStatefulWidget extends StatefulWidget {
  ColorStatefulWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ColorStatefulWidgetState();
  }
}

class _ColorStatefulWidgetState extends State<ColorStatefulWidget> {
  late final Color color;

  @override
  void initState() {
    super.initState();
    color = randomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Center(
        child: Text('${widget.hashCode}'),
      ),
    );
  }
}

Color randomColor() => [
      Colors.blue,
      Colors.amber,
      Colors.black,
      Colors.red,
      Colors.blueGrey,
      Colors.cyan,
      Colors.cyanAccent,
    ][Random().nextInt(7)];
