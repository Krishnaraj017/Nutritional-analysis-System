// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncParamsImpl _$$SyncParamsImplFromJson(Map<String, dynamic> json) =>
    _$SyncParamsImpl(
      hydration: (json['hydration'] as List<dynamic>)
          .map((e) => Hydration.fromJson(e as Map<String, dynamic>))
          .toList(),
      sleep: (json['sleep'] as List<dynamic>)
          .map((e) => Sleep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SyncParamsImplToJson(_$SyncParamsImpl instance) =>
    <String, dynamic>{
      'hydration': instance.hydration.map((e) => e.toJson()).toList(),
      'sleep': instance.sleep.map((e) => e.toJson()).toList(),
    };
