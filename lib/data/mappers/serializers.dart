import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:razor_erp_exam/data/mappers/weather_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  WeatherModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
