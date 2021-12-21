import 'package:flutter/material.dart';

class CityWidget extends StatelessWidget {
  final String cityName;
  final Function() onTap;

  CityWidget({required this.cityName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Text(
          cityName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
