import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:razor_erp_exam/data/mappers/serializers.dart';

part 'weather_model.g.dart';

abstract class WeatherModel
    implements Built<WeatherModel, WeatherModelBuilder> {
  String get cod;
  int get message;
  int get cnt;
  BuiltList<WeatherData> get list;
  City get city;

  WeatherModel._();
  factory WeatherModel([void Function(WeatherModelBuilder) updates]) =
      _$WeatherModel;

  static Serializer<WeatherModel> get serializer => _$weatherModelSerializer;
  Map<String, dynamic>? toJson() {
    return serializers.serializeWith(WeatherModel.serializer, this)
        as Map<String, dynamic>;
  }

  static WeatherModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WeatherModel.serializer, json);
  }
}

abstract class WeatherData implements Built<WeatherData, WeatherDataBuilder> {
  int get dt;
  MainWeather get main;
  BuiltList<WeatherCondition> get weather;
  Clouds get clouds;
  Wind get wind;
  int get visibility;
  double get pop;
  Sys get sys;

  @BuiltValueField(wireName: 'dt_txt')
  String get dtTxt;

  Rain? get rain;

  WeatherData._();
  factory WeatherData([void Function(WeatherDataBuilder) updates]) =
      _$WeatherData;

  static Serializer<WeatherData> get serializer => _$weatherDataSerializer;
}

abstract class MainWeather implements Built<MainWeather, MainWeatherBuilder> {
  double get temp;

  @BuiltValueField(wireName: 'feels_like')
  double get feelsLike;

  @BuiltValueField(wireName: 'temp_min')
  double get tempMin;

  @BuiltValueField(wireName: 'temp_max')
  double get tempMax;

  int get pressure;

  @BuiltValueField(wireName: 'sea_level')
  int get seaLevel;

  @BuiltValueField(wireName: 'grnd_level')
  int get grndLevel;

  int get humidity;

  @BuiltValueField(wireName: 'temp_kf')
  double get tempKf;

  MainWeather._();
  factory MainWeather([void Function(MainWeatherBuilder) updates]) =
      _$MainWeather;

  static Serializer<MainWeather> get serializer => _$mainWeatherSerializer;
}

abstract class WeatherCondition
    implements Built<WeatherCondition, WeatherConditionBuilder> {
  int get id;
  String get main;
  String get description;
  String get icon;

  WeatherCondition._();
  factory WeatherCondition([void Function(WeatherConditionBuilder) updates]) =
      _$WeatherCondition;

  static Serializer<WeatherCondition> get serializer =>
      _$weatherConditionSerializer;
}

abstract class Clouds implements Built<Clouds, CloudsBuilder> {
  int get all;

  Clouds._();
  factory Clouds([void Function(CloudsBuilder) updates]) = _$Clouds;

  static Serializer<Clouds> get serializer => _$cloudsSerializer;
}

abstract class Wind implements Built<Wind, WindBuilder> {
  double get speed;
  int get deg;
  double get gust;

  Wind._();
  factory Wind([void Function(WindBuilder) updates]) = _$Wind;

  static Serializer<Wind> get serializer => _$windSerializer;
}

abstract class Sys implements Built<Sys, SysBuilder> {
  String get pod;

  Sys._();
  factory Sys([void Function(SysBuilder) updates]) = _$Sys;

  static Serializer<Sys> get serializer => _$sysSerializer;
}

abstract class Rain implements Built<Rain, RainBuilder> {
  @BuiltValueField(wireName: '3h')
  double get threeH;

  Rain._();
  factory Rain([void Function(RainBuilder) updates]) = _$Rain;

  static Serializer<Rain> get serializer => _$rainSerializer;
}

abstract class City implements Built<City, CityBuilder> {
  int get id;
  String get name;
  Coord get coord;
  String get country;
  int get population;
  int get timezone;
  int get sunrise;
  int get sunset;

  City._();
  factory City([void Function(CityBuilder) updates]) = _$City;

  static Serializer<City> get serializer => _$citySerializer;
}

abstract class Coord implements Built<Coord, CoordBuilder> {
  double get lat;
  double get lon;

  Coord._();
  factory Coord([void Function(CoordBuilder) updates]) = _$Coord;

  static Serializer<Coord> get serializer => _$coordSerializer;
}
