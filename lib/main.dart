import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:razor_erp_exam/core/modules/app_modules.dart';
import 'package:razor_erp_exam/core/theme/theme.dart';
import 'package:razor_erp_exam/presentation/current_weather/current_weather_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiBlocProvider(
      providers: BlocProviders.getBlocProviders(),
      child: MaterialApp(
        theme: lightTheme,
        home: const Scaffold(
          body: CurrentWeatherPage(),
        ),
      ),
    );
  }
}
