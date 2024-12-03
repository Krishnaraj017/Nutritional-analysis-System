import 'package:json_annotation/json_annotation.dart';
import 'package:statedemo/data/models/weather.dart';
import 'package:statedemo/data/models/weather_location.dart';

part 'weather_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherResponse {
  final WeatherLocation location;
  final Weather current;

  WeatherResponse({required this.location, required this.current});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
