import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String time;
  final String temp;
  final IconData icon;

  const WeatherIcon(
      {super.key, required this.time, required this.temp, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(icon, size: 24),
        const SizedBox(height: 5),
        Text(time),
        const SizedBox(height: 5),
        Text(temp),
      ],
    );
  }
}
