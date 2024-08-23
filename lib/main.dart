import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razor_erp_exam/gen/assets.gen.dart';
import 'package:razor_erp_exam/presentation/current_weather/current_weather_page.dart';

void main() {
  runApp(MyApp());
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.ralewayTextTheme(
      baseTheme.textTheme,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildTheme(Brightness.light),
      home: const Scaffold(body: CurrentWeatherPage()),
    );
  }
}
