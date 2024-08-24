import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:razor_erp_exam/data/data_sources/remote_data_source.dart';
import 'package:razor_erp_exam/data/mappers/weather_model.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';

abstract interface class WeatherRepository {
  Future<Either<ApiException, WeatherModel>> getRemoteWeather({
    required num lat,
    required num long,
  });
  Future<Either<ApiException, Position>> getLatLong();
}

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteWeatherService remoteWeatherService;

  WeatherRepositoryImpl(this.remoteWeatherService);

  @override
  Future<Either<ApiException, WeatherModel>> getRemoteWeather({
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
