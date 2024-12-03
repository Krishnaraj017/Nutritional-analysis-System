// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tips _$TipsFromJson(Map<String, dynamic> json) => Tips(
      json['message'] as String,
      json['tip'] as String,
      json['status'] as int,
    );

Map<String, dynamic> _$TipsToJson(Tips instance) => <String, dynamic>{
      'message': instance.message,
      'tip': instance.tip,
      'status': instance.status,
    };
