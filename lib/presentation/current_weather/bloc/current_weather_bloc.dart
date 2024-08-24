import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:razor_erp_exam/core/bloc_utils/common_state.dart';
import 'package:razor_erp_exam/data/mappers/serializers.dart';
import 'package:razor_erp_exam/data/mappers/weather_model.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';
import 'package:razor_erp_exam/domain/usecases/get_lat_long_usecase.dart';
import 'package:razor_erp_exam/domain/usecases/get_weather_usecase.dart';

part './current_weather_event.dart';
part './current_weather_state.dart';

class CurrentWeatherBloc
    extends HydratedBloc<CurrentWeatherEvent, CurrentWeatherState> {
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

    await pos.fold(
      (err) async {
        emit(ErrorState(ApiException(code: err.code, message: err.message)));
      },
      (coordinates) async {
        final response = await getWeatherUseCase(
          GetWeatherParams(
            lat: coordinates.latitude,
            lon: coordinates.longitude,
          ),
        );

        await response.fold(
          (err) async {
            emit(
                ErrorState(ApiException(code: err.code, message: err.message)));
          },
          (entity) async {
            emit(LoadedWeatherState(entity));
          },
        );
      },
    );
  }

  @override
  CurrentWeatherState fromJson(Map<String, dynamic> json) {
    try {
      final lastState =
          serializers.deserializeWith(WeatherModel.serializer, json);
      if (lastState != null) {
        return LoadedWeatherState(lastState);
      }
      return const EmptyState();
    } catch (e) {
      return const EmptyState();
    }
  }

  @override
  Map<String, dynamic>? toJson(CurrentWeatherState state) {
    if (state is LoadedWeatherState) {

      return state.weatherEntity.toJson();
    }
    return null;
  }
}
