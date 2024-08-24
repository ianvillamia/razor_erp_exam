// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'weather_model.dart';

class WeatherModelMapper extends ClassMapperBase<WeatherModel> {
  WeatherModelMapper._();

  static WeatherModelMapper? _instance;
  static WeatherModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeatherModelMapper._());
      HourlyWeatherModelMapper.ensureInitialized();
      CurrentWeatherModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WeatherModel';

  static num _$lat(WeatherModel v) => v.lat;
  static const Field<WeatherModel, num> _f$lat = Field('lat', _$lat);
  static num _$lon(WeatherModel v) => v.lon;
  static const Field<WeatherModel, num> _f$lon = Field('lon', _$lon);
  static String _$timezone(WeatherModel v) => v.timezone;
  static const Field<WeatherModel, String> _f$timezone =
      Field('timezone', _$timezone);
  static int _$timezoneOffset(WeatherModel v) => v.timezoneOffset;
  static const Field<WeatherModel, int> _f$timezoneOffset =
      Field('timezoneOffset', _$timezoneOffset, key: 'timezone_offset');
  static List<HourlyWeatherModel> _$hourly(WeatherModel v) => v.hourly;
  static const Field<WeatherModel, List<HourlyWeatherModel>> _f$hourly =
      Field('hourly', _$hourly);
  static CurrentWeatherModel _$current(WeatherModel v) => v.current;
  static const Field<WeatherModel, CurrentWeatherModel> _f$current =
      Field('current', _$current);

  @override
  final MappableFields<WeatherModel> fields = const {
    #lat: _f$lat,
    #lon: _f$lon,
    #timezone: _f$timezone,
    #timezoneOffset: _f$timezoneOffset,
    #hourly: _f$hourly,
    #current: _f$current,
  };

  static WeatherModel _instantiate(DecodingData data) {
    return WeatherModel(
        lat: data.dec(_f$lat),
        lon: data.dec(_f$lon),
        timezone: data.dec(_f$timezone),
        timezoneOffset: data.dec(_f$timezoneOffset),
        hourly: data.dec(_f$hourly),
        current: data.dec(_f$current));
  }

  @override
  final Function instantiate = _instantiate;

  static WeatherModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WeatherModel>(map);
  }

  static WeatherModel fromJson(String json) {
    return ensureInitialized().decodeJson<WeatherModel>(json);
  }
}

mixin WeatherModelMappable {
  String toJson() {
    return WeatherModelMapper.ensureInitialized()
        .encodeJson<WeatherModel>(this as WeatherModel);
  }

  Map<String, dynamic> toMap() {
    return WeatherModelMapper.ensureInitialized()
        .encodeMap<WeatherModel>(this as WeatherModel);
  }

  WeatherModelCopyWith<WeatherModel, WeatherModel, WeatherModel> get copyWith =>
      _WeatherModelCopyWithImpl(this as WeatherModel, $identity, $identity);
  @override
  String toString() {
    return WeatherModelMapper.ensureInitialized()
        .stringifyValue(this as WeatherModel);
  }

  @override
  bool operator ==(Object other) {
    return WeatherModelMapper.ensureInitialized()
        .equalsValue(this as WeatherModel, other);
  }

  @override
  int get hashCode {
    return WeatherModelMapper.ensureInitialized()
        .hashValue(this as WeatherModel);
  }
}

extension WeatherModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WeatherModel, $Out> {
  WeatherModelCopyWith<$R, WeatherModel, $Out> get $asWeatherModel =>
      $base.as((v, t, t2) => _WeatherModelCopyWithImpl(v, t, t2));
}

abstract class WeatherModelCopyWith<$R, $In extends WeatherModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      HourlyWeatherModel,
      HourlyWeatherModelCopyWith<$R, HourlyWeatherModel,
          HourlyWeatherModel>> get hourly;
  CurrentWeatherModelCopyWith<$R, CurrentWeatherModel, CurrentWeatherModel>
      get current;
  $R call(
      {num? lat,
      num? lon,
      String? timezone,
      int? timezoneOffset,
      List<HourlyWeatherModel>? hourly,
      CurrentWeatherModel? current});
  WeatherModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WeatherModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WeatherModel, $Out>
    implements WeatherModelCopyWith<$R, WeatherModel, $Out> {
  _WeatherModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WeatherModel> $mapper =
      WeatherModelMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      HourlyWeatherModel,
      HourlyWeatherModelCopyWith<$R, HourlyWeatherModel,
          HourlyWeatherModel>> get hourly => ListCopyWith(
      $value.hourly, (v, t) => v.copyWith.$chain(t), (v) => call(hourly: v));
  @override
  CurrentWeatherModelCopyWith<$R, CurrentWeatherModel, CurrentWeatherModel>
      get current => $value.current.copyWith.$chain((v) => call(current: v));
  @override
  $R call(
          {num? lat,
          num? lon,
          String? timezone,
          int? timezoneOffset,
          List<HourlyWeatherModel>? hourly,
          CurrentWeatherModel? current}) =>
      $apply(FieldCopyWithData({
        if (lat != null) #lat: lat,
        if (lon != null) #lon: lon,
        if (timezone != null) #timezone: timezone,
        if (timezoneOffset != null) #timezoneOffset: timezoneOffset,
        if (hourly != null) #hourly: hourly,
        if (current != null) #current: current
      }));
  @override
  WeatherModel $make(CopyWithData data) => WeatherModel(
      lat: data.get(#lat, or: $value.lat),
      lon: data.get(#lon, or: $value.lon),
      timezone: data.get(#timezone, or: $value.timezone),
      timezoneOffset: data.get(#timezoneOffset, or: $value.timezoneOffset),
      hourly: data.get(#hourly, or: $value.hourly),
      current: data.get(#current, or: $value.current));

  @override
  WeatherModelCopyWith<$R2, WeatherModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WeatherModelCopyWithImpl($value, $cast, t);
}

class HourlyWeatherModelMapper extends ClassMapperBase<HourlyWeatherModel> {
  HourlyWeatherModelMapper._();

  static HourlyWeatherModelMapper? _instance;
  static HourlyWeatherModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HourlyWeatherModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HourlyWeatherModel';

  static int _$dt(HourlyWeatherModel v) => v.dt;
  static const Field<HourlyWeatherModel, int> _f$dt = Field('dt', _$dt);
  static double _$temp(HourlyWeatherModel v) => v.temp;
  static const Field<HourlyWeatherModel, double> _f$temp =
      Field('temp', _$temp);
  static double _$feelsLike(HourlyWeatherModel v) => v.feelsLike;
  static const Field<HourlyWeatherModel, double> _f$feelsLike =
      Field('feelsLike', _$feelsLike, key: 'feels_like');
  static int _$pressure(HourlyWeatherModel v) => v.pressure;
  static const Field<HourlyWeatherModel, int> _f$pressure =
      Field('pressure', _$pressure);
  static int _$humidity(HourlyWeatherModel v) => v.humidity;
  static const Field<HourlyWeatherModel, int> _f$humidity =
      Field('humidity', _$humidity);
  static double _$dewPoint(HourlyWeatherModel v) => v.dewPoint;
  static const Field<HourlyWeatherModel, double> _f$dewPoint =
      Field('dewPoint', _$dewPoint, key: 'dew_point');
  static double _$uvi(HourlyWeatherModel v) => v.uvi;
  static const Field<HourlyWeatherModel, double> _f$uvi = Field('uvi', _$uvi);
  static int _$clouds(HourlyWeatherModel v) => v.clouds;
  static const Field<HourlyWeatherModel, int> _f$clouds =
      Field('clouds', _$clouds);
  static int _$visibility(HourlyWeatherModel v) => v.visibility;
  static const Field<HourlyWeatherModel, int> _f$visibility =
      Field('visibility', _$visibility);
  static double _$windSpeed(HourlyWeatherModel v) => v.windSpeed;
  static const Field<HourlyWeatherModel, double> _f$windSpeed =
      Field('windSpeed', _$windSpeed, key: 'wind_speed');
  static int _$windDeg(HourlyWeatherModel v) => v.windDeg;
  static const Field<HourlyWeatherModel, int> _f$windDeg =
      Field('windDeg', _$windDeg, key: 'wind_deg');
  static double _$windGust(HourlyWeatherModel v) => v.windGust;
  static const Field<HourlyWeatherModel, double> _f$windGust =
      Field('windGust', _$windGust, key: 'wind_gust');
  static List<WeatherConditionEntity> _$weather(HourlyWeatherModel v) =>
      v.weather;
  static const Field<HourlyWeatherModel, List<WeatherConditionEntity>>
      _f$weather = Field('weather', _$weather);
  static double _$pop(HourlyWeatherModel v) => v.pop;
  static const Field<HourlyWeatherModel, double> _f$pop = Field('pop', _$pop);

  @override
  final MappableFields<HourlyWeatherModel> fields = const {
    #dt: _f$dt,
    #temp: _f$temp,
    #feelsLike: _f$feelsLike,
    #pressure: _f$pressure,
    #humidity: _f$humidity,
    #dewPoint: _f$dewPoint,
    #uvi: _f$uvi,
    #clouds: _f$clouds,
    #visibility: _f$visibility,
    #windSpeed: _f$windSpeed,
    #windDeg: _f$windDeg,
    #windGust: _f$windGust,
    #weather: _f$weather,
    #pop: _f$pop,
  };

  static HourlyWeatherModel _instantiate(DecodingData data) {
    return HourlyWeatherModel(
        dt: data.dec(_f$dt),
        temp: data.dec(_f$temp),
        feelsLike: data.dec(_f$feelsLike),
        pressure: data.dec(_f$pressure),
        humidity: data.dec(_f$humidity),
        dewPoint: data.dec(_f$dewPoint),
        uvi: data.dec(_f$uvi),
        clouds: data.dec(_f$clouds),
        visibility: data.dec(_f$visibility),
        windSpeed: data.dec(_f$windSpeed),
        windDeg: data.dec(_f$windDeg),
        windGust: data.dec(_f$windGust),
        weather: data.dec(_f$weather),
        pop: data.dec(_f$pop));
  }

  @override
  final Function instantiate = _instantiate;

  static HourlyWeatherModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HourlyWeatherModel>(map);
  }

  static HourlyWeatherModel fromJson(String json) {
    return ensureInitialized().decodeJson<HourlyWeatherModel>(json);
  }
}

mixin HourlyWeatherModelMappable {
  String toJson() {
    return HourlyWeatherModelMapper.ensureInitialized()
        .encodeJson<HourlyWeatherModel>(this as HourlyWeatherModel);
  }

  Map<String, dynamic> toMap() {
    return HourlyWeatherModelMapper.ensureInitialized()
        .encodeMap<HourlyWeatherModel>(this as HourlyWeatherModel);
  }

  HourlyWeatherModelCopyWith<HourlyWeatherModel, HourlyWeatherModel,
          HourlyWeatherModel>
      get copyWith => _HourlyWeatherModelCopyWithImpl(
          this as HourlyWeatherModel, $identity, $identity);
  @override
  String toString() {
    return HourlyWeatherModelMapper.ensureInitialized()
        .stringifyValue(this as HourlyWeatherModel);
  }

  @override
  bool operator ==(Object other) {
    return HourlyWeatherModelMapper.ensureInitialized()
        .equalsValue(this as HourlyWeatherModel, other);
  }

  @override
  int get hashCode {
    return HourlyWeatherModelMapper.ensureInitialized()
        .hashValue(this as HourlyWeatherModel);
  }
}

extension HourlyWeatherModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HourlyWeatherModel, $Out> {
  HourlyWeatherModelCopyWith<$R, HourlyWeatherModel, $Out>
      get $asHourlyWeatherModel =>
          $base.as((v, t, t2) => _HourlyWeatherModelCopyWithImpl(v, t, t2));
}

abstract class HourlyWeatherModelCopyWith<$R, $In extends HourlyWeatherModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, WeatherConditionEntity,
          ObjectCopyWith<$R, WeatherConditionEntity, WeatherConditionEntity>>
      get weather;
  $R call(
      {int? dt,
      double? temp,
      double? feelsLike,
      int? pressure,
      int? humidity,
      double? dewPoint,
      double? uvi,
      int? clouds,
      int? visibility,
      double? windSpeed,
      int? windDeg,
      double? windGust,
      List<WeatherConditionEntity>? weather,
      double? pop});
  HourlyWeatherModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HourlyWeatherModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HourlyWeatherModel, $Out>
    implements HourlyWeatherModelCopyWith<$R, HourlyWeatherModel, $Out> {
  _HourlyWeatherModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HourlyWeatherModel> $mapper =
      HourlyWeatherModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, WeatherConditionEntity,
          ObjectCopyWith<$R, WeatherConditionEntity, WeatherConditionEntity>>
      get weather => ListCopyWith($value.weather,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(weather: v));
  @override
  $R call(
          {int? dt,
          double? temp,
          double? feelsLike,
          int? pressure,
          int? humidity,
          double? dewPoint,
          double? uvi,
          int? clouds,
          int? visibility,
          double? windSpeed,
          int? windDeg,
          double? windGust,
          List<WeatherConditionEntity>? weather,
          double? pop}) =>
      $apply(FieldCopyWithData({
        if (dt != null) #dt: dt,
        if (temp != null) #temp: temp,
        if (feelsLike != null) #feelsLike: feelsLike,
        if (pressure != null) #pressure: pressure,
        if (humidity != null) #humidity: humidity,
        if (dewPoint != null) #dewPoint: dewPoint,
        if (uvi != null) #uvi: uvi,
        if (clouds != null) #clouds: clouds,
        if (visibility != null) #visibility: visibility,
        if (windSpeed != null) #windSpeed: windSpeed,
        if (windDeg != null) #windDeg: windDeg,
        if (windGust != null) #windGust: windGust,
        if (weather != null) #weather: weather,
        if (pop != null) #pop: pop
      }));
  @override
  HourlyWeatherModel $make(CopyWithData data) => HourlyWeatherModel(
      dt: data.get(#dt, or: $value.dt),
      temp: data.get(#temp, or: $value.temp),
      feelsLike: data.get(#feelsLike, or: $value.feelsLike),
      pressure: data.get(#pressure, or: $value.pressure),
      humidity: data.get(#humidity, or: $value.humidity),
      dewPoint: data.get(#dewPoint, or: $value.dewPoint),
      uvi: data.get(#uvi, or: $value.uvi),
      clouds: data.get(#clouds, or: $value.clouds),
      visibility: data.get(#visibility, or: $value.visibility),
      windSpeed: data.get(#windSpeed, or: $value.windSpeed),
      windDeg: data.get(#windDeg, or: $value.windDeg),
      windGust: data.get(#windGust, or: $value.windGust),
      weather: data.get(#weather, or: $value.weather),
      pop: data.get(#pop, or: $value.pop));

  @override
  HourlyWeatherModelCopyWith<$R2, HourlyWeatherModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HourlyWeatherModelCopyWithImpl($value, $cast, t);
}

class CurrentWeatherModelMapper extends ClassMapperBase<CurrentWeatherModel> {
  CurrentWeatherModelMapper._();

  static CurrentWeatherModelMapper? _instance;
  static CurrentWeatherModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CurrentWeatherModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CurrentWeatherModel';

  static int _$dt(CurrentWeatherModel v) => v.dt;
  static const Field<CurrentWeatherModel, int> _f$dt = Field('dt', _$dt);
  static int _$sunrise(CurrentWeatherModel v) => v.sunrise;
  static const Field<CurrentWeatherModel, int> _f$sunrise =
      Field('sunrise', _$sunrise);
  static int _$sunset(CurrentWeatherModel v) => v.sunset;
  static const Field<CurrentWeatherModel, int> _f$sunset =
      Field('sunset', _$sunset);
  static double _$temp(CurrentWeatherModel v) => v.temp;
  static const Field<CurrentWeatherModel, double> _f$temp =
      Field('temp', _$temp);
  static double _$feelsLike(CurrentWeatherModel v) => v.feelsLike;
  static const Field<CurrentWeatherModel, double> _f$feelsLike =
      Field('feelsLike', _$feelsLike, key: 'feels_like');
  static int _$pressure(CurrentWeatherModel v) => v.pressure;
  static const Field<CurrentWeatherModel, int> _f$pressure =
      Field('pressure', _$pressure);
  static int _$humidity(CurrentWeatherModel v) => v.humidity;
  static const Field<CurrentWeatherModel, int> _f$humidity =
      Field('humidity', _$humidity);
  static double _$dewPoint(CurrentWeatherModel v) => v.dewPoint;
  static const Field<CurrentWeatherModel, double> _f$dewPoint =
      Field('dewPoint', _$dewPoint, key: 'dew_point');
  static double _$uvi(CurrentWeatherModel v) => v.uvi;
  static const Field<CurrentWeatherModel, double> _f$uvi = Field('uvi', _$uvi);
  static int _$clouds(CurrentWeatherModel v) => v.clouds;
  static const Field<CurrentWeatherModel, int> _f$clouds =
      Field('clouds', _$clouds);
  static int _$visibility(CurrentWeatherModel v) => v.visibility;
  static const Field<CurrentWeatherModel, int> _f$visibility =
      Field('visibility', _$visibility);
  static double _$windSpeed(CurrentWeatherModel v) => v.windSpeed;
  static const Field<CurrentWeatherModel, double> _f$windSpeed =
      Field('windSpeed', _$windSpeed, key: 'wind_speed');
  static int _$windDeg(CurrentWeatherModel v) => v.windDeg;
  static const Field<CurrentWeatherModel, int> _f$windDeg =
      Field('windDeg', _$windDeg, key: 'wind_deg');
  static double _$windGust(CurrentWeatherModel v) => v.windGust;
  static const Field<CurrentWeatherModel, double> _f$windGust =
      Field('windGust', _$windGust, key: 'wind_gust');
  static List<WeatherConditionEntity> _$weather(CurrentWeatherModel v) =>
      v.weather;
  static const Field<CurrentWeatherModel, List<WeatherConditionEntity>>
      _f$weather = Field('weather', _$weather);

  @override
  final MappableFields<CurrentWeatherModel> fields = const {
    #dt: _f$dt,
    #sunrise: _f$sunrise,
    #sunset: _f$sunset,
    #temp: _f$temp,
    #feelsLike: _f$feelsLike,
    #pressure: _f$pressure,
    #humidity: _f$humidity,
    #dewPoint: _f$dewPoint,
    #uvi: _f$uvi,
    #clouds: _f$clouds,
    #visibility: _f$visibility,
    #windSpeed: _f$windSpeed,
    #windDeg: _f$windDeg,
    #windGust: _f$windGust,
    #weather: _f$weather,
  };

  static CurrentWeatherModel _instantiate(DecodingData data) {
    return CurrentWeatherModel(
        dt: data.dec(_f$dt),
        sunrise: data.dec(_f$sunrise),
        sunset: data.dec(_f$sunset),
        temp: data.dec(_f$temp),
        feelsLike: data.dec(_f$feelsLike),
        pressure: data.dec(_f$pressure),
        humidity: data.dec(_f$humidity),
        dewPoint: data.dec(_f$dewPoint),
        uvi: data.dec(_f$uvi),
        clouds: data.dec(_f$clouds),
        visibility: data.dec(_f$visibility),
        windSpeed: data.dec(_f$windSpeed),
        windDeg: data.dec(_f$windDeg),
        windGust: data.dec(_f$windGust),
        weather: data.dec(_f$weather));
  }

  @override
  final Function instantiate = _instantiate;

  static CurrentWeatherModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CurrentWeatherModel>(map);
  }

  static CurrentWeatherModel fromJson(String json) {
    return ensureInitialized().decodeJson<CurrentWeatherModel>(json);
  }
}

mixin CurrentWeatherModelMappable {
  String toJson() {
    return CurrentWeatherModelMapper.ensureInitialized()
        .encodeJson<CurrentWeatherModel>(this as CurrentWeatherModel);
  }

  Map<String, dynamic> toMap() {
    return CurrentWeatherModelMapper.ensureInitialized()
        .encodeMap<CurrentWeatherModel>(this as CurrentWeatherModel);
  }

  CurrentWeatherModelCopyWith<CurrentWeatherModel, CurrentWeatherModel,
          CurrentWeatherModel>
      get copyWith => _CurrentWeatherModelCopyWithImpl(
          this as CurrentWeatherModel, $identity, $identity);
  @override
  String toString() {
    return CurrentWeatherModelMapper.ensureInitialized()
        .stringifyValue(this as CurrentWeatherModel);
  }

  @override
  bool operator ==(Object other) {
    return CurrentWeatherModelMapper.ensureInitialized()
        .equalsValue(this as CurrentWeatherModel, other);
  }

  @override
  int get hashCode {
    return CurrentWeatherModelMapper.ensureInitialized()
        .hashValue(this as CurrentWeatherModel);
  }
}

extension CurrentWeatherModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CurrentWeatherModel, $Out> {
  CurrentWeatherModelCopyWith<$R, CurrentWeatherModel, $Out>
      get $asCurrentWeatherModel =>
          $base.as((v, t, t2) => _CurrentWeatherModelCopyWithImpl(v, t, t2));
}

abstract class CurrentWeatherModelCopyWith<$R, $In extends CurrentWeatherModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, WeatherConditionEntity,
          ObjectCopyWith<$R, WeatherConditionEntity, WeatherConditionEntity>>
      get weather;
  $R call(
      {int? dt,
      int? sunrise,
      int? sunset,
      double? temp,
      double? feelsLike,
      int? pressure,
      int? humidity,
      double? dewPoint,
      double? uvi,
      int? clouds,
      int? visibility,
      double? windSpeed,
      int? windDeg,
      double? windGust,
      List<WeatherConditionEntity>? weather});
  CurrentWeatherModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CurrentWeatherModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CurrentWeatherModel, $Out>
    implements CurrentWeatherModelCopyWith<$R, CurrentWeatherModel, $Out> {
  _CurrentWeatherModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CurrentWeatherModel> $mapper =
      CurrentWeatherModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, WeatherConditionEntity,
          ObjectCopyWith<$R, WeatherConditionEntity, WeatherConditionEntity>>
      get weather => ListCopyWith($value.weather,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(weather: v));
  @override
  $R call(
          {int? dt,
          int? sunrise,
          int? sunset,
          double? temp,
          double? feelsLike,
          int? pressure,
          int? humidity,
          double? dewPoint,
          double? uvi,
          int? clouds,
          int? visibility,
          double? windSpeed,
          int? windDeg,
          double? windGust,
          List<WeatherConditionEntity>? weather}) =>
      $apply(FieldCopyWithData({
        if (dt != null) #dt: dt,
        if (sunrise != null) #sunrise: sunrise,
        if (sunset != null) #sunset: sunset,
        if (temp != null) #temp: temp,
        if (feelsLike != null) #feelsLike: feelsLike,
        if (pressure != null) #pressure: pressure,
        if (humidity != null) #humidity: humidity,
        if (dewPoint != null) #dewPoint: dewPoint,
        if (uvi != null) #uvi: uvi,
        if (clouds != null) #clouds: clouds,
        if (visibility != null) #visibility: visibility,
        if (windSpeed != null) #windSpeed: windSpeed,
        if (windDeg != null) #windDeg: windDeg,
        if (windGust != null) #windGust: windGust,
        if (weather != null) #weather: weather
      }));
  @override
  CurrentWeatherModel $make(CopyWithData data) => CurrentWeatherModel(
      dt: data.get(#dt, or: $value.dt),
      sunrise: data.get(#sunrise, or: $value.sunrise),
      sunset: data.get(#sunset, or: $value.sunset),
      temp: data.get(#temp, or: $value.temp),
      feelsLike: data.get(#feelsLike, or: $value.feelsLike),
      pressure: data.get(#pressure, or: $value.pressure),
      humidity: data.get(#humidity, or: $value.humidity),
      dewPoint: data.get(#dewPoint, or: $value.dewPoint),
      uvi: data.get(#uvi, or: $value.uvi),
      clouds: data.get(#clouds, or: $value.clouds),
      visibility: data.get(#visibility, or: $value.visibility),
      windSpeed: data.get(#windSpeed, or: $value.windSpeed),
      windDeg: data.get(#windDeg, or: $value.windDeg),
      windGust: data.get(#windGust, or: $value.windGust),
      weather: data.get(#weather, or: $value.weather));

  @override
  CurrentWeatherModelCopyWith<$R2, CurrentWeatherModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CurrentWeatherModelCopyWithImpl($value, $cast, t);
}

class WeatherConditionModelMapper
    extends ClassMapperBase<WeatherConditionModel> {
  WeatherConditionModelMapper._();

  static WeatherConditionModelMapper? _instance;
  static WeatherConditionModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeatherConditionModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WeatherConditionModel';

  static int _$id(WeatherConditionModel v) => v.id;
  static const Field<WeatherConditionModel, int> _f$id = Field('id', _$id);
  static String _$main(WeatherConditionModel v) => v.main;
  static const Field<WeatherConditionModel, String> _f$main =
      Field('main', _$main);
  static String _$description(WeatherConditionModel v) => v.description;
  static const Field<WeatherConditionModel, String> _f$description =
      Field('description', _$description);
  static String _$icon(WeatherConditionModel v) => v.icon;
  static const Field<WeatherConditionModel, String> _f$icon =
      Field('icon', _$icon);

  @override
  final MappableFields<WeatherConditionModel> fields = const {
    #id: _f$id,
    #main: _f$main,
    #description: _f$description,
    #icon: _f$icon,
  };

  static WeatherConditionModel _instantiate(DecodingData data) {
    return WeatherConditionModel(
        id: data.dec(_f$id),
        main: data.dec(_f$main),
        description: data.dec(_f$description),
        icon: data.dec(_f$icon));
  }

  @override
  final Function instantiate = _instantiate;

  static WeatherConditionModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WeatherConditionModel>(map);
  }

  static WeatherConditionModel fromJson(String json) {
    return ensureInitialized().decodeJson<WeatherConditionModel>(json);
  }
}

mixin WeatherConditionModelMappable {
  String toJson() {
    return WeatherConditionModelMapper.ensureInitialized()
        .encodeJson<WeatherConditionModel>(this as WeatherConditionModel);
  }

  Map<String, dynamic> toMap() {
    return WeatherConditionModelMapper.ensureInitialized()
        .encodeMap<WeatherConditionModel>(this as WeatherConditionModel);
  }

  WeatherConditionModelCopyWith<WeatherConditionModel, WeatherConditionModel,
          WeatherConditionModel>
      get copyWith => _WeatherConditionModelCopyWithImpl(
          this as WeatherConditionModel, $identity, $identity);
  @override
  String toString() {
    return WeatherConditionModelMapper.ensureInitialized()
        .stringifyValue(this as WeatherConditionModel);
  }

  @override
  bool operator ==(Object other) {
    return WeatherConditionModelMapper.ensureInitialized()
        .equalsValue(this as WeatherConditionModel, other);
  }

  @override
  int get hashCode {
    return WeatherConditionModelMapper.ensureInitialized()
        .hashValue(this as WeatherConditionModel);
  }
}

extension WeatherConditionModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WeatherConditionModel, $Out> {
  WeatherConditionModelCopyWith<$R, WeatherConditionModel, $Out>
      get $asWeatherConditionModel =>
          $base.as((v, t, t2) => _WeatherConditionModelCopyWithImpl(v, t, t2));
}

abstract class WeatherConditionModelCopyWith<
    $R,
    $In extends WeatherConditionModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? main, String? description, String? icon});
  WeatherConditionModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _WeatherConditionModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WeatherConditionModel, $Out>
    implements WeatherConditionModelCopyWith<$R, WeatherConditionModel, $Out> {
  _WeatherConditionModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WeatherConditionModel> $mapper =
      WeatherConditionModelMapper.ensureInitialized();
  @override
  $R call({int? id, String? main, String? description, String? icon}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (main != null) #main: main,
        if (description != null) #description: description,
        if (icon != null) #icon: icon
      }));
  @override
  WeatherConditionModel $make(CopyWithData data) => WeatherConditionModel(
      id: data.get(#id, or: $value.id),
      main: data.get(#main, or: $value.main),
      description: data.get(#description, or: $value.description),
      icon: data.get(#icon, or: $value.icon));

  @override
  WeatherConditionModelCopyWith<$R2, WeatherConditionModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _WeatherConditionModelCopyWithImpl($value, $cast, t);
}
