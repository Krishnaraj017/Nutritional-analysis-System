//{
//         "name": "Mangalore",
//         "region": "Karnataka",
//         "country": "India",
//         "lat": 12.86,
//         "lon": 74.84,
//         "tz_id": "Asia/Kolkata",
//         "localtime_epoch": 1704292860,
//         "localtime": "2024-01-03 20:11"
//     },

import 'package:json_annotation/json_annotation.dart';

part 'weather_location.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherLocation {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  WeatherLocation({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLocationToJson(this);
}
