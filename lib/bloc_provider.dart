import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razor_erp_exam/core/modules/app_modules.dart';
import 'package:razor_erp_exam/domain/usecases/get_weather_usecase.dart';
import 'package:razor_erp_exam/presentation/current_weather/bloc/current_weather_bloc.dart';

class BlocProviders {
  static getBlocProviders() {
    return [
      BlocProvider<CurrentWeatherBloc>(
        create: (_) => CurrentWeatherBloc(
          getIt.get<GetWeatherUseCase>(),
        ),
      )
    ];
  }
}
