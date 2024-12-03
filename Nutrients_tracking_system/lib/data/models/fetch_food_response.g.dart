// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchFoodResponse _$FetchFoodResponseFromJson(Map<String, dynamic> json) =>
    FetchFoodResponse(
      message: json['message'] as String,
      result: (json['result'] as List<dynamic>)
          .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int,
    );

Map<String, dynamic> _$FetchFoodResponseToJson(FetchFoodResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };
