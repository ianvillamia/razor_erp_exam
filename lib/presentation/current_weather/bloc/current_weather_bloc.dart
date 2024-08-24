import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:razor_erp_exam/core/bloc_utils/common_state.dart';
import 'package:razor_erp_exam/data/api_client.dart';
import 'package:razor_erp_exam/domain/entities/weather_entity.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';
import 'package:razor_erp_exam/domain/usecases/get_weather_usecase.dart';

part './current_weather_event.dart';
part './current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final WeatherApiClient getWeatherUseCase;
  CurrentWeatherBloc(this.getWeatherUseCase) : super(const InitialState()) {
    on<GetWeatherDataEvent>(_getWeatherData);
  }
  Future<void> _getWeatherData(
    GetWeatherDataEvent event,
    Emitter<CurrentWeatherState> emit,
  ) async {
    emit(const LoadingState());

    // final response = await getWeatherUseCase(
    //   GetWeatherParams(
    //     lat: event.lat,
    //     long: event.long,
    //   ),
    // );

    // return response.fold(
    //   (err) =>
    //       emit(ErrorState(ApiException(code: err.code, message: err.message))),
    //   (entity) => emit(LoadedWeatherState(entity)),
    // );
  }
}
