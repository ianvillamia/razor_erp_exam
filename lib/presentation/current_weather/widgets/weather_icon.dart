import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String time;
  final String temp;
  final Widget icon;

  const WeatherIcon(
      {super.key, required this.time, required this.temp, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 50,
          child: icon,
        ),
        const SizedBox(height: 5),
        Text(time),
        const SizedBox(height: 5),
        Text(temp),
      ],
    );
  }
}
