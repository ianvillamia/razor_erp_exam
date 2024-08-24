import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:razor_erp_exam/data/data_sources/remote_data_source.dart';
import 'package:razor_erp_exam/domain/entities/weather_entity.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';

abstract interface class WeatherRepository {
  Future<Either<ApiException, WeatherEntity>> getRemoteWeather({
    required num lat,
    required num long,
  });
  Future<Either<ApiException, Position>> getLatLong();
}

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteWeatherService remoteWeatherService;

  WeatherRepositoryImpl(this.remoteWeatherService);

  @override
  Future<Either<ApiException, WeatherEntity>> getRemoteWeather({
    required num lat,
    required num long,
  }) {
    return remoteWeatherService.getWeather(lat: lat, long: long);
  }

  @override
  Future<Either<ApiException, Position>> getLatLong() {
    return remoteWeatherService.getLatLong();
  }
}
