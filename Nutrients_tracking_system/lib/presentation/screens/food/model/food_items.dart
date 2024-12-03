import 'package:isar/isar.dart';
part 'food_items.g.dart';

@Collection()
class FoodItems {
  Id? isarId = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String id;
  String foodName;
  double proteins;
  double carbs;
  double fats;
  double calories;
  String quantity;
  String foodId; // Additional fields
  String category;
  int v;
  DateTime createdAt;
  DateTime updatedAt;
  double totQuantity;

  FoodItems({
    this.isarId,
    required this.id,
    required this.foodName,
    required this.proteins,
    required this.carbs,
    required this.fats,
    required this.calories,
    required this.quantity,
    required this.foodId,
    required this.category,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    this.totQuantity = 1,
  });

  factory FoodItems.fromJson(Map<String, dynamic> json) {
    return FoodItems(
      id: json['_id'],
      foodName: json['name'],
      proteins: json['proteins'].toDouble(),
      carbs: json['carbohydrates'].toDouble(),
      fats: json['fats'].toDouble(),
      calories: json['calories'].toDouble(),
      quantity: json['quantity'],
      foodId: json['foodId'],
      category: json['category'],
      v: json['__v'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      totQuantity: json['quantity'], // Initialize quantity from JSON
    );
  }
}
