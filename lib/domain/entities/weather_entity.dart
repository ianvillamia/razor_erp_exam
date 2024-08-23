class WeatherEntity {
  final num lat;
  final num lon;
  final String timezone;
  final int timezoneOffset;
  final CurrentWeatherEntity current;
  final List<HourlyWeatherEntity> hourly;

  WeatherEntity({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
  });
}

class CurrentWeatherEntity {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<WeatherConditionEntity> weather;

  CurrentWeatherEntity({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });
}

class HourlyWeatherEntity {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<WeatherConditionEntity> weather;
  final double pop;

  HourlyWeatherEntity({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });
}

class WeatherConditionEntity {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherConditionEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}
