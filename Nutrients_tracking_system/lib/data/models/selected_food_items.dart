// import 'package:isar/isar.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:statedemo/data/models/food_item.dart';
// import 'package:statedemo/domain/entities/enums.dart';
// part 'selected_food_items.dart';
// @JsonSerializable()
// @Collection()
// class SelectedFoodItem {
//   Id? id = Isar.autoIncrement;
//   @Index(type: IndexType.value)

//    @enumerated  final MealType mealType;

//   final FoodItem foodItem;

//   SelectedFoodItem({
//     required this.foodItem,
//     required this.mealType,
//   });

//   factory SelectedFoodItem.fromJson(Map<String, dynamic> json) =>
//       _$SelectedFoodItemFromJson(json);

//   Map<String, dynamic> toJson() => _$SelectedFoodItemToJson(this);
// }
