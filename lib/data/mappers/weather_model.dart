// ignore_for_file: overridden_fields

import 'package:dart_mappable/dart_mappable.dart';
import 'package:razor_erp_exam/domain/entities/weather_entity.dart';

part 'weather_model.mapper.dart';

@MappableClass()
class WeatherModel extends WeatherEntity with WeatherModelMappable {
  WeatherModel({
    required super.lat,
    required super.lon,
    required super.timezone,
    @MappableField(key: 'timezone_offset') required super.timezoneOffset,
    required this.hourly,
    required this.current,
  }) : super(
          current: current,
          hourly: hourly,
        );

  @override
  final CurrentWeatherModel current;
  @override
  final List<HourlyWeatherModel> hourly;
}

@MappableClass()
class CurrentWeatherModel extends CurrentWeatherEntity
    with CurrentWeatherModelMappable {
  CurrentWeatherModel({
    required super.dt,
    required super.sunrise,
    required super.sunset,
    required super.temp,
    @MappableField(key: 'feels_like') required super.feelsLike,
    required super.pressure,
    required super.humidity,
    @MappableField(key: 'dew_point') required super.dewPoint,
    required super.uvi,
    required super.clouds,
    required super.visibility,
    @MappableField(key: 'wind_speed') required super.windSpeed,
    @MappableField(key: 'wind_deg') required super.windDeg,
    @MappableField(key: 'wind_gust') required super.windGust,
    required this.weather,
  }) : super(weather: weather);
  @override
  final List<WeatherConditionEntity> weather;
}

@MappableClass()
class HourlyWeatherModel extends HourlyWeatherEntity
    with HourlyWeatherModelMappable {
  HourlyWeatherModel({
    required super.dt,
    required super.temp,
    @MappableField(key: 'feels_like') required super.feelsLike,
    required super.pressure,
    required super.humidity,
    @MappableField(key: 'dew_point') required super.dewPoint,
    required super.uvi,
    required super.clouds,
    required super.visibility,
    @MappableField(key: 'wind_speed') required super.windSpeed,
    @MappableField(key: 'wind_deg') required super.windDeg,
    @MappableField(key: 'wind_gust') required super.windGust,
    required this.weather,
    required super.pop,
  }) : super(weather: weather);

  @override
  final List<WeatherConditionEntity> weather;
}

@MappableClass()
class WeatherConditionModel extends WeatherConditionEntity
    with WeatherConditionModelMappable {
  WeatherConditionModel({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });
}
