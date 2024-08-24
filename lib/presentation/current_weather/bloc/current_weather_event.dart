part of 'current_weather_bloc.dart';

abstract class CurrentWeatherEvent extends Equatable {
  const CurrentWeatherEvent();
}

class GetWeatherDataEvent extends CurrentWeatherEvent {
  const GetWeatherDataEvent({
    required this.lat,
    required this.long,
  });
  final num lat;
  final num long;

  @override
  List<Object?> get props => [lat, long];
}
