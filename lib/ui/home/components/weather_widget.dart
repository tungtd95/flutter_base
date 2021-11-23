import 'package:flutter/material.dart';
import 'package:flutter_base/data/models/city.dart';
import 'package:flutter_base/data/models/weather.dart';

class WeatherWidget extends StatelessWidget {
  final void Function()? onSelected;
  final void Function()? onRemoved;
  final City city;
  final Weather weather;

  WeatherWidget({
    required this.city,
    required this.weather,
    this.onSelected = null,
    this.onRemoved = null,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Row(
        children: [
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(city.getFullName()),
                SizedBox(height: 6),
                Text(
                  '${weather.main?.temp ?? 0} Fahrenheit',
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, size: 24),
            iconSize: 44,
            padding: EdgeInsets.all(8),
            onPressed: onRemoved,
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
