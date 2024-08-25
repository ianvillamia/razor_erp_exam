import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:razor_erp_exam/core/modules/app_modules.dart';
import 'package:razor_erp_exam/core/theme/theme.dart';
import 'package:razor_erp_exam/presentation/current_weather/current_weather_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc_provider.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  // Initialize HydratedStorage
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(), // For mobile
  );

  // Assign the storage to HydratedBloc
  HydratedBloc.storage = storage;
  runApp(
    const MyApp(),
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
