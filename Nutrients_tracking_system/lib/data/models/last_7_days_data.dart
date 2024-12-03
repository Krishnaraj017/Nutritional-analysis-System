import 'package:json_annotation/json_annotation.dart';
import 'package:statedemo/data/models/sleep.dart';

import 'hydration.dart';

part 'last_7_days_data.g.dart';

@JsonSerializable()
class Last7DaysData {
  @JsonKey(name: 'hydration', fromJson: fromJsonHydrationList)
  final List<Hydration> hydrations;
  @JsonKey(name: 'sleep', fromJson: fromJsonSleepList)
  final List<Sleep> sleeps;

  Last7DaysData({
    this.hydrations = const [],
    this.sleeps = const [],
  });

  factory Last7DaysData.fromJson(Map<String, dynamic> json) =>
      _$Last7DaysDataFromJson(json);

  static List<Hydration> fromJsonHydrationList(List<dynamic> json) {
    return json.map((e) => Hydration.fromServer(e)).toList();
  }

  static List<Sleep> fromJsonSleepList(List<dynamic> json) {
    return json.map((e) => Sleep.fromServer(e)).toList();
  }
}
