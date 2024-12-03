// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedFood _$SelectedFoodFromJson(Map<String, dynamic> json) => SelectedFood(
      foodid: json['foodid'] as String,
      name: json['name'] as String,
      calories: json['calories'] as int,
      proteins: json['proteins'] as int,
      carbohydrates: json['carbohydrates'] as int,
      fats: json['fats'] as int,
      catogory: json['catogory'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$SelectedFoodToJson(SelectedFood instance) =>
    <String, dynamic>{
      'foodid': instance.foodid,
      'name': instance.name,
      'calories': instance.calories,
      'proteins': instance.proteins,
      'carbohydrates': instance.carbohydrates,
      'fats': instance.fats,
      'catogory': instance.catogory,
      'quantity': instance.quantity,
    };
