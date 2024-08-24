import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:razor_erp_exam/data/api_client.dart';
import 'package:razor_erp_exam/domain/usecases/get_weather_usecase.dart';
import 'package:razor_erp_exam/presentation/current_weather/bloc/current_weather_bloc.dart';

class BlocProviders {
  static getBlocProviders() {
    return [
      BlocProvider<CurrentWeatherBloc>(
        create: (_) => CurrentWeatherBloc(
          Modular.get<WeatherApiClient>(),
        ),
      )
    ];
  }
}
