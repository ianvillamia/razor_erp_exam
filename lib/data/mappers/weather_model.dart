import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather_model.g.dart';

abstract class WeatherModel
    implements Built<WeatherModel, WeatherModelBuilder> {
  // Fields
  double get lat;
  double get lon;

  // Constructor
  WeatherModel._();
  factory WeatherModel([void Function(WeatherModelBuilder) updates]) =
      _$WeatherModel;

  // Serializer
  static Serializer<WeatherModel> get serializer => _$weatherModelSerializer;
}
