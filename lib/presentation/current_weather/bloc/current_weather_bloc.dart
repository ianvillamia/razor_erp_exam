import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:razor_erp_exam/core/bloc_utils/common_state.dart';
import 'package:razor_erp_exam/domain/entities/weather_entity.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';
import 'package:razor_erp_exam/domain/usecases/get_lat_long_usecase.dart';
import 'package:razor_erp_exam/domain/usecases/get_weather_usecase.dart';

part './current_weather_event.dart';
part './current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetLatLongUseCase getLatLongUseCase;
  CurrentWeatherBloc(
    this.getWeatherUseCase,
    this.getLatLongUseCase,
  ) : super(const InitialState()) {
    on<GetWeatherDataEvent>(_getWeatherData);
  }
  Future<void> _getWeatherData(
    GetWeatherDataEvent event,
    Emitter<CurrentWeatherState> emit,
  ) async {
    emit(const LoadingState());
    final pos = await getLatLongUseCase.call(unit);
    pos.fold(left, (coordinates) async {
      final response = await getWeatherUseCase(
        GetWeatherParams(
          lat: coordinates.latitude,
          long: coordinates.longitude,
        ),
      );

      return response.fold(
        (err) => emit(
            ErrorState(ApiException(code: err.code, message: err.message))),
        (entity) => emit(LoadedWeatherState(entity)),
      );
    });
  }
}
