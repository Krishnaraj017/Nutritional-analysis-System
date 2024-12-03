import 'package:json_annotation/json_annotation.dart';
part 'selected_food.g.dart';

@JsonSerializable()
class SelectedFood {
  final String foodid;
  final String name;
  final int calories;
  final int proteins;
  final int carbohydrates;
  final int fats;
  final String catogory;
  final String quantity;
  SelectedFood({ 
    required this.foodid,
    required this.name,
    required this.calories,
    required this.proteins,
    required this.carbohydrates,
    required this.fats,
    required this.catogory,
    required this.quantity,
  });
  factory SelectedFood.fromJson(Map<String, dynamic> json) =>
      _$SelectedFoodFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedFoodToJson(this);
}
