import 'package:fpdart/fpdart.dart';
import 'package:razor_erp_exam/core/api_exception.dart';
import 'package:razor_erp_exam/data/data_sources/remote_data_source.dart';
import 'package:razor_erp_exam/domain/entities/weather_entity.dart';

abstract interface class WeatherRepository {
  Future<Either<ApiException, WeatherEntity>> getWeather({
    required num lat,
    required num long,
  });
}

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteWeatherService remoteWeatherService;

  WeatherRepositoryImpl(this.remoteWeatherService);

  @override
  Future<Either<ApiException, WeatherEntity>> getWeather({
    required num lat,
    required num long,
  }) {
    return remoteWeatherService.getWeather(lat: lat, long: long);
  }
}
