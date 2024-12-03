import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:statedemo/domain/entities/enums.dart';
part 'food_item.g.dart';

@JsonSerializable()
@Collection()
class FoodItem {
  Id? id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  final String foodid;

  final String name;
  final int calories;
  final int proteins;
  final int carbohydrates;
  final int fats;
  final String catogory;
  final String quantity;

  @enumerated
  MealType mealType;

  int totQuantity;
  bool isSelected; // Adding isSelected property

  FoodItem({
    required this.foodid,
    required this.name,
    required this.calories,
    required this.proteins,
    required this.carbohydrates,
    required this.fats,
    required this.catogory,
    required this.quantity,
    this.totQuantity = 1,
    this.isSelected = false,
    this.mealType = MealType.breakfast,
  });
  int get foodidToInt => int.tryParse(foodid) ?? 0;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);

  Map<String, dynamic> toJson() => _$FoodItemToJson(this);
}
