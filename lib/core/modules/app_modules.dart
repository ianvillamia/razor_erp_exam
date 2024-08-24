import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:razor_erp_exam/core/secrets/app_secrets.dart';
import 'package:razor_erp_exam/data/api_client.dart';
import 'package:razor_erp_exam/data/data_sources/remote_data_source.dart';
import 'package:razor_erp_exam/domain/repositories/weather_repository.dart';
import 'package:razor_erp_exam/domain/usecases/get_weather_usecase.dart';

// class AppModule extends Module {
//   @override
//   List<Bind<Object>> get binds {
//     return [
//       Bind.factory<Dio>((i) {
//         final dio = Dio(BaseOptions(baseUrl: 'https://api.openweathermap.org'));

//         // Add an interceptor to include the API key in all requests
//         dio.interceptors.add(InterceptorsWrapper(
//           onRequest: (options, handler) {
//             options.queryParameters['appid'] = AppSecrets.openWeatherApiKey;
//             return handler.next(options); // Continue with the request
//           },
//         ));

//         return dio;
//       }),
//       Bind.factory<WeatherApiClient>((i) => WeatherApiClient(i<Dio>())),
//       Bind.factory<RemoteWeatherService>(
//           (i) => RemoteWeatherServiceImpl(i<WeatherApiClient>())),
//       Bind.factory<WeatherRepository>(
//           (i) => WeatherRepositoryImpl(i<RemoteWeatherService>())),
//       Bind.factory<RemoteWeatherService>(
//           (i) => RemoteWeatherServiceImpl(i<WeatherApiClient>())),
//       Bind.factory<GetWeatherUseCase>(
//         (i) => GetWeatherUseCase(i<WeatherRepository>()),
//         export: true,
//       ),
//     ];
//   }
// }

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<Dio>(() {
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

    i.addLazySingleton<WeatherApiClient>((i) => WeatherApiClient(i()));
    i.addLazySingleton<RemoteWeatherService>(
        (i) => RemoteWeatherServiceImpl(i<WeatherApiClient>()));
    i.addLazySingleton<WeatherRepository>(
        (i) => WeatherRepositoryImpl(i<RemoteWeatherService>()));
    i.addLazySingleton<GetWeatherUseCase>(
        (i) => GetWeatherUseCase(i<WeatherRepository>()));
  }
}
