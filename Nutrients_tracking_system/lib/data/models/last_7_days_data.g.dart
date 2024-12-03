// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_7_days_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Last7DaysData _$Last7DaysDataFromJson(Map<String, dynamic> json) =>
    Last7DaysData(
      hydrations: json['hydration'] == null
          ? const []
          : Last7DaysData.fromJsonHydrationList(json['hydration'] as List),
      sleeps: json['sleep'] == null
          ? const []
          : Last7DaysData.fromJsonSleepList(json['sleep'] as List),
    );

Map<String, dynamic> _$Last7DaysDataToJson(Last7DaysData instance) =>
    <String, dynamic>{
      'hydration': instance.hydrations.map((e) => e.toJson()).toList(),
      'sleep': instance.sleeps.map((e) => e.toJson()).toList(),
    };
