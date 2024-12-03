// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weather_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWeatherParams _$GetWeatherParamsFromJson(Map<String, dynamic> json) =>
    GetWeatherParams(
      query: json['q'] as String,
      aqi: json['aqi'] as String? ?? 'no',
    );

Map<String, dynamic> _$GetWeatherParamsToJson(GetWeatherParams instance) =>
    <String, dynamic>{
      'key': instance.key,
      'q': instance.query,
      'aqi': instance.aqi,
    };
