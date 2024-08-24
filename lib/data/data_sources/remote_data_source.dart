import 'package:fpdart/fpdart.dart';
import 'package:razor_erp_exam/data/api_client.dart';
import 'package:razor_erp_exam/data/mappers/weather_model.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';

abstract interface class RemoteWeatherService {
  Future<Either<ApiException, WeatherModel>> getWeather({
    required num lat,
    required num long,
  });
}

class RemoteWeatherServiceImpl implements RemoteWeatherService {
  final WeatherApiClient client;

  RemoteWeatherServiceImpl(this.client);

  @override
  Future<Either<ApiException, WeatherModel>> getWeather({
    required num lat,
    required num long,
  }) async {
    return client.get(
      '/data/3.0/onecall?lat=$lat&lon=$long',
      WeatherModelMapper.fromMap,
    );
  }
}
