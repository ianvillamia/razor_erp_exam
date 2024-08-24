import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

import 'weather_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  WeatherModel,
  WeatherData,
  MainWeather,
  WeatherCondition,
  Clouds,
  Wind,
  Sys,
  Rain,
  City,
  Coord,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
