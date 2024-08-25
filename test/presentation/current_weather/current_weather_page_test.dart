import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:razor_erp_exam/core/keys/keys.dart';
import 'package:razor_erp_exam/data/mappers/weather_model.dart';
import 'package:razor_erp_exam/presentation/current_weather/bloc/current_weather_bloc.dart';
import 'package:razor_erp_exam/presentation/current_weather/current_weather_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MockCurrentWeatherBloc
    extends MockBloc<CurrentWeatherEvent, CurrentWeatherState>
    implements CurrentWeatherBloc {}

void main() {
  late MockCurrentWeatherBloc mockBloc;
  late WeatherModel weatherModel;
  setUp(() {
    mockBloc = MockCurrentWeatherBloc();
    final weatherList = List.generate(5, (i) {
      return WeatherData((b) => b
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
        ..rain.replace(Rain((b) => b..threeH = 0.0)));
    });
    weatherModel = WeatherModel((b) => b
      ..cod = '200'
      ..message = 0
      ..cnt = 40
      ..list.addAll(weatherList)
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

  tearDown(() {
    mockBloc.close();
  });

  testWidgets('renders weather page with loaded state',
      (WidgetTester tester) async {
    // Arrange
    when(() => mockBloc.state).thenReturn(LoadedWeatherState(weatherModel));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CurrentWeatherBloc>(
          create: (_) => mockBloc,
          child: const CurrentWeatherPage(),
        ),
      ),
    );
    await tester.pump(Duration.zero); // Skip animations

    expect(find.byKey(Keys.sunnyText), findsOneWidget);
    expect(find.byKey(Keys.gradientText), findsOneWidget);
    expect(find.byKey(Keys.cityText), findsOneWidget);
    expect(find.byKey(Keys.curvedContainer), findsOneWidget);
  });
}
