import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';

import 'package:razor_erp_exam/domain/repositories/weather_repository.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';

class GetLatLongUseCase extends BaseUseCase<Position, Unit> {
  GetLatLongUseCase(this.weatherRepository);

  final WeatherRepository weatherRepository;

  @override
  Future<Either<ApiException, Position>> call(Unit params) async {
    final getWeather = await weatherRepository.getLatLong();
    return getWeather.fold(left, (data) {
      return Right(data);
    });
  }
}
