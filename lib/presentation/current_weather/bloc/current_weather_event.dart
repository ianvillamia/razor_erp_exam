part of 'current_weather_bloc.dart';

abstract class CurrentWeatherEvent extends Equatable {
  const CurrentWeatherEvent();
}

class GetWeatherDataEvent extends CurrentWeatherEvent {
  const GetWeatherDataEvent();

  @override
  List<Object?> get props => [];
}

class GetWeatherDataEventOffline extends CurrentWeatherEvent {
  const GetWeatherDataEventOffline();

  @override
  List<Object?> get props => [];
}
