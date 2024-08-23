import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:razor_erp_exam/core/modules/app_modules.dart';
import 'package:razor_erp_exam/core/theme/theme.dart';
import 'package:razor_erp_exam/presentation/current_weather/current_weather_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc_provider.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Scaffold(
        body: MultiBlocProvider(
          providers: blocProviders,
          child: const CurrentWeatherPage(),
        ),
      ),
    );
  }
}
