import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:razor_erp_exam/core/secrets/app_secrets.dart';
import 'package:razor_erp_exam/data/api_client.dart';
import 'package:razor_erp_exam/data/data_sources/remote_data_source.dart';
import 'package:razor_erp_exam/domain/repositories/weather_repository.dart';
import 'package:razor_erp_exam/domain/usecases/get_lat_long_usecase.dart';
import 'package:razor_erp_exam/domain/usecases/get_weather_usecase.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.openweathermap.org'));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      options.queryParameters['appid'] = AppSecrets.openWeatherApiKey;
      return handler.next(options); // Continue with the request
    },
  ));
  dio.interceptors.add(PrettyDioLogger());

// customization
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      filter: (options, args) {
        // don't print requests with uris containing '/posts'
        if (options.path.contains('/posts')) {
          return false;
        }
        // don't print responses with unit8 list data
        return !args.isResponse || !args.hasUint8ListData;
      }));

  getIt.registerSingleton<Dio>(dio);

  // Register other dependencies lazily
  getIt.registerLazySingleton<WeatherApiClient>(
      () => WeatherApiClient(getIt<Dio>()));

  getIt.registerLazySingleton<RemoteWeatherService>(
      () => RemoteWeatherServiceImpl(getIt<WeatherApiClient>()));

  getIt.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(getIt<RemoteWeatherService>()));

  getIt.registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(getIt<WeatherRepository>()));
  getIt.registerLazySingleton<GetLatLongUseCase>(
      () => GetLatLongUseCase(getIt<WeatherRepository>()));
}
