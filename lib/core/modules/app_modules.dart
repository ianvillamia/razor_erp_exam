import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:razor_erp_exam/core/secrets/app_secrets.dart';
import 'package:razor_erp_exam/data/api_client.dart';
import 'package:razor_erp_exam/data/data_sources/remote_data_source.dart';
import 'package:razor_erp_exam/domain/repositories/weather_repository.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.openweathermap.org'));

      // Add an interceptor to include the API key in all requests
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['appid'] = AppSecrets.openWeatherApiKey;
          return handler.next(options); // Continue with the request
        },
      ));

      return dio;
    });

    i.addSingleton<WeatherApiClient>(
      (i) => WeatherApiClient(i()),
    );
    i.addLazySingleton<RemoteWeatherService>(
      () => RemoteWeatherServiceImpl(i()),
    );
    i.addLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(i()));
  }
}
