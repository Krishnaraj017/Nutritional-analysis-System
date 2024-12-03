import 'package:json_annotation/json_annotation.dart';
import 'package:statedemo/utils/constants/env.dart';

part 'get_weather_params.g.dart';

@JsonSerializable()
class GetWeatherParams {
  @JsonKey(includeToJson: true)
  final String key = Env.weatherApiKey;

  @JsonKey(name: 'q')
  final String query;

  final String aqi;

  GetWeatherParams({
    required this.query,
    this.aqi = 'no',
  });

  factory GetWeatherParams.fromJson(Map<String, dynamic> json) =>
      _$GetWeatherParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetWeatherParamsToJson(this);
}
