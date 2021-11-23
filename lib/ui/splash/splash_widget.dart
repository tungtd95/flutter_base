import 'package:flutter/material.dart';
import 'package:flutter_base/utils/assets.dart';
import 'package:flutter_base/utils/common_utils.dart';
import 'package:rive/rive.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F1F7F9'),
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: RiveAnimation.asset(Assets.animGang,
                        fit: BoxFit.contain),
                    width: 300,
                    height: 250,
                  ),
                  Text('Discover weather in your beloved cities'),
                ],
              ),
            ),
          ),
          Positioned(
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black45,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            top: 44,
            right: 24,
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Image.asset(
              Assets.imgSekiro,
              width: 20,
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
