import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:razor_erp_exam/domain/usecases/get_weather_usecase.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';
part 'current_weather_bloc.freezed.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  CurrentWeatherBloc(this.getWeatherUseCase) : super(const _Initial()) {
    on<CurrentWeatherEvent>((event, emit) {});
  }
}
