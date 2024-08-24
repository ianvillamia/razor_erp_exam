part of 'current_weather_bloc.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();
}

class LoadedWeatherState extends CurrentWeatherState {
  const LoadedWeatherState(this.weatherEntity);
  final WeatherModel weatherEntity;

  @override
  List<Object?> get props => [weatherEntity];
}
