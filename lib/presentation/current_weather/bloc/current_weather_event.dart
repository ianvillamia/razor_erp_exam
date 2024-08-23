part of 'current_weather_bloc.dart';

@freezed
class CurrentWeatherEvent with _$CurrentWeatherEvent {
  const factory CurrentWeatherEvent.started() = _Started;
}