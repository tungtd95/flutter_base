import 'package:flutter/material.dart';
import 'package:flutter_base/utils/assets.dart';

class NotFoundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.imgNotFound,
          width: 150,
        ),
      ),
    );
  }
}
