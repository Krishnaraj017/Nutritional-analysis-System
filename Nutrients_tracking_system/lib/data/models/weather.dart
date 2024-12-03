//last_updated	string	Local time when the real time data was updated.
// last_updated_epoch	int	Local time when the real time data was updated in unix time.
// temp_c	decimal	Temperature in celsius
// temp_f	decimal	Temperature in fahrenheit
// feelslike_c	decimal	Feels like temperature in celsius
// feelslike_f	decimal	Feels like temperature in fahrenheit
// condition:text	string	Weather condition text
// condition:icon	string	Weather icon url
// condition:code	int	Weather condition unique code.
// wind_mph	decimal	Wind speed in miles per hour
// wind_kph	decimal	Wind speed in kilometer per hour
// wind_degree	int	Wind direction in degrees
// wind_dir	string	Wind direction as 16 point compass. e.g.: NSW
// pressure_mb	decimal	Pressure in millibars
// pressure_in	decimal	Pressure in inches
// precip_mm	decimal	Precipitation amount in millimeters
// precip_in	decimal	Precipitation amount in inches
// humidity	int	Humidity as percentage
// cloud	int	Cloud cover as percentage
// is_day	int	1 = Yes 0 = No
// Whether to show day condition icon or night icon
// uv	decimal	UV Index
// gust_mph	decimal	Wind gust in miles per hour
// gust_kph	decimal	Wind gust in kilometer per hour

import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: true)
class Weather {
  /// Local time when the real time data was updated.
  final String lastUpdated;

  /// Local time when the real time data was updated in unix time.
  final int lastUpdatedEpoch;

  /// Temperature in celsius
  final double tempC;

  /// Temperature in fahrenheit
  final double tempF;

  /// Feels like temperature in celsius
  @JsonKey(name: 'feelslike_c')
  final double feelsLikeC;

  /// Feels like temperature in fahrenheit
  @JsonKey(name: 'feelslike_f')
  final double feelsLikeF;

  /// Weather condition details
  final WeatherCondition condition;

  /// Wind speed in miles per hour
  final double windMph;

  /// Wind speed in kilometer per hour
  final double windKph;

  /// Wind direction in degrees
  final int windDegree;

  /// Wind direction as 16 point compass. e.g.: NSW
  final String windDir;

  /// Pressure in millibars
  final double pressureMb;

  /// Pressure in inches
  final double pressureIn;

  /// Precipitation amount in millimeters
  final double precipMm;

  /// Precipitation amount in inches
  final double precipIn;

  /// Humidity as percentage
  final int humidity;

  /// Cloud cover as percentage
  final int cloud;

  /// 1 = Yes 0 = No
  /// Whether to show day condition icon or night icon
  final int isDay;

  /// UV Index
  final double uv;

  /// Wind gust in miles per hour
  final double gustMph;

  /// Wind gust in kilometer per hour
  final double gustKph;

  Weather({
    required this.lastUpdated,
    required this.lastUpdatedEpoch,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.isDay,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherCondition {
  /// Weather condition text
  final String text;

  /// Weather icon url
  final String icon;

  /// Weather condition unique code.
  final int code;

  WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);
}
