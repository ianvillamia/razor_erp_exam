import 'package:fpdart/fpdart.dart';
import 'package:razor_erp_exam/data/mappers/weather_model.dart';

import 'package:razor_erp_exam/domain/repositories/weather_repository.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';

class GetWeatherUseCase extends BaseUseCase<WeatherModel, GetWeatherParams> {
  GetWeatherUseCase(this.weatherRepository);

  final WeatherRepository weatherRepository;

  @override
  Future<Either<ApiException, WeatherModel>> call(
    GetWeatherParams params,
  ) async {
    final getWeather = await weatherRepository.getRemoteWeather(
      lat: params.lat,
      long: params.long,
    );
    return getWeather.fold(left, (data) {
      return Right(data);
    });
  }
}

class GetWeatherParams {
  const GetWeatherParams({
    required this.lat,
    required this.long,
  });

  final num lat;
  final num long;
}
