import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:razor_erp_exam/data/mappers/weather_model.dart';
import 'package:razor_erp_exam/domain/usecases/base_usecase.dart';
import 'package:razor_erp_exam/domain/usecases/get_lat_long_usecase.dart';
import 'package:razor_erp_exam/domain/usecases/get_weather_usecase.dart';
import 'package:razor_erp_exam/presentation/current_weather/bloc/current_weather_bloc.dart';
import 'package:razor_erp_exam/core/bloc_utils/common_state.dart';
import 'package:fpdart/fpdart.dart';

// Mocking the use cases
class MockGetWeatherUseCase extends Mock implements GetWeatherUseCase {}

class MockGetLatLongUseCase extends Mock implements GetLatLongUseCase {}

class MockStorage extends Mock implements Storage {}

class FakeGetWeatherParams extends Fake implements GetWeatherParams {}

void main() async {
  late CurrentWeatherBloc currentWeatherBloc;
  late MockGetWeatherUseCase mockGetWeatherUseCase;
  late MockGetLatLongUseCase mockGetLatLongUseCase;
  late Storage hydratedStorage;
  late WeatherModel weatherModel;

  setUpAll(() {
    registerFallbackValue(FakeGetWeatherParams());
  });

  setUp(() {
    mockGetWeatherUseCase = MockGetWeatherUseCase();
    mockGetLatLongUseCase = MockGetLatLongUseCase();

    hydratedStorage = MockStorage();
    when(
      () => hydratedStorage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = hydratedStorage;
    currentWeatherBloc = CurrentWeatherBloc(
      mockGetWeatherUseCase,
      mockGetLatLongUseCase,
    );
    weatherModel = WeatherModel((b) => b
      ..cod = '200'
      ..message = 0
      ..cnt = 40
      ..list.addAll([
        WeatherData((b) => b
          ..dt = 1620000000
          ..main.replace(MainWeather((b) => b
            ..temp = 299.15
            ..feelsLike = 298.56
            ..tempMin = 298.15
            ..tempMax = 300.15
            ..pressure = 1013
            ..seaLevel = 1013
            ..grndLevel = 1009
            ..humidity = 85
            ..tempKf = 1.0))
          ..weather.addAll([
            WeatherCondition((b) => b
              ..id = 800
              ..main = 'Clear'
              ..description = 'clear sky'
              ..icon = '01d'),
          ])
          ..clouds.replace(Clouds((b) => b..all = 1))
          ..wind.replace(Wind((b) => b
            ..speed = 4.12
            ..deg = 240
            ..gust = 7.24))
          ..visibility = 10000
          ..pop = 0.1
          ..sys.replace(Sys((b) => b..pod = 'd'))
          ..dtTxt = '2021-05-03 12:00:00'
          ..rain.replace(Rain((b) => b..threeH = 0.0))),
        // Add more WeatherData objects if needed
      ])
      ..city.replace(City((b) => b
        ..id = 2643743
        ..name = 'London'
        ..coord.replace(Coord((b) => b
          ..lat = 51.5074
          ..lon = -0.1278))
        ..country = 'GB'
        ..population = 8908081
        ..timezone = 3600
        ..sunrise = 1620018000
        ..sunset = 1620066000)));
  });

  test('initial state should be InitialState', () {
    expect(currentWeatherBloc.state, equals(const InitialState()));
  });

  blocTest<CurrentWeatherBloc, CurrentWeatherState>(
    'emits [LoadingState, LoadedWeatherState] when GetWeatherDataEvent is added and data is fetched successfully',
    build: () {
      final mockCoordinates = Position(
        latitude: 10.0,
        longitude: 10.0,
        timestamp: DateTime.now(),
        altitude: 0.0,
        accuracy: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
        altitudeAccuracy: 0.0,
        headingAccuracy: 0.0,
      );

      when(() => mockGetLatLongUseCase.call(unit))
          .thenAnswer((_) async => Right(mockCoordinates));

      when(
        () => mockGetWeatherUseCase.call(any()),
      ).thenAnswer((_) async => Right(weatherModel));

      return currentWeatherBloc;
    },
    act: (bloc) => bloc.add(const GetWeatherDataEvent()),
    expect: () => [
      const LoadingState(),
      LoadedWeatherState(weatherModel),
    ],
  );

  blocTest<CurrentWeatherBloc, CurrentWeatherState>(
    'emits [LoadingState, ErrorState] when GetWeatherDataEvent is added and fetching location fails',
    build: () {
      when(() => mockGetLatLongUseCase.call(unit)).thenAnswer((_) async =>
          Left(ApiException(code: '404', message: 'Location not found')));

      return currentWeatherBloc;
    },
    act: (bloc) => bloc.add(const GetWeatherDataEvent()),
    expect: () => [
      const LoadingState(),
      ErrorState(ApiException(code: '404', message: 'Location not found')),
    ],
  );

  blocTest<CurrentWeatherBloc, CurrentWeatherState>(
    'emits [LoadingState, ErrorState] when GetWeatherDataEvent is added and fetching weather fails',
    build: () {
      final mockCoordinates = Position(
        latitude: 10.0,
        longitude: 10.0,
        timestamp: DateTime.now(),
        altitude: 0.0,
        accuracy: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
        altitudeAccuracy: 0.0,
        headingAccuracy: 0.0,
      );

      when(() => mockGetLatLongUseCase.call(unit))
          .thenAnswer((_) async => Right(mockCoordinates));

      when(
        () => mockGetWeatherUseCase.call(any()),
      ).thenAnswer((_) async =>
          Left(ApiException(code: '500', message: 'Internal Server Error')));

      return currentWeatherBloc;
    },
    act: (bloc) => bloc.add(const GetWeatherDataEvent()),
    expect: () => [
      const LoadingState(),
      ErrorState(ApiException(code: '500', message: 'Internal Server Error')),
    ],
  );

  test('fromJson should return LoadedWeatherState when valid json is provided',
      () {
    final json = weatherModel.toJson();
    final result = currentWeatherBloc.fromJson(json!);

    expect(result, isA<LoadedWeatherState>());
    expect((result as LoadedWeatherState).weatherEntity, weatherModel);
  });

  test('toJson should return valid json when state is LoadedWeatherState', () {
    final state = LoadedWeatherState(weatherModel);
    final result = currentWeatherBloc.toJson(state);

    expect(result, weatherModel.toJson());
  });

  test('toJson should return null when state is not LoadedWeatherState', () {
    final result = currentWeatherBloc.toJson(const EmptyState());

    expect(result, isNull);
  });
}
