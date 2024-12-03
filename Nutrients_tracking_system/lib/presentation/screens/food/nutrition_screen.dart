import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:isar/isar.dart';
import 'package:statedemo/presentation/screens/food/model/food_items.dart';

@RoutePage()
class NutritionScreen extends StatefulWidget {
  const NutritionScreen({
    super.key,
  });

  @override
  _ShowFoodScreenState createState() => _ShowFoodScreenState();
}

class _ShowFoodScreenState extends State<NutritionScreen> {
  late Isar _isar;
  late List<FoodItems> foodItems = []; // Initialize as empty list

  @override
  void initState() {
    super.initState();
    _initializeIsar();
  }

  Future<void> _initializeIsar() async {
    _isar = Isar.getInstance()!;
    await getFoods(); // Wait for getFoods to complete
  }

  Future<void> getFoods() async {
    var foodItemsQuery = await _isar.foodItems.where().findAll();
    setState(() {
      foodItems = foodItemsQuery.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Your UI code using foodItems...
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Food Details'),
      ),
      body: foodItems.isEmpty
          ? const Center(
              child: Text('No food items added yet'),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                FoodItems foodItem = foodItems[index];
                foodItem.calories = foodItem.totQuantity * foodItem.calories;
                foodItem.proteins = foodItem.proteins * foodItem.totQuantity;
                foodItem.carbs = foodItem.carbs * foodItem.totQuantity;
                foodItem.fats = foodItem.fats * foodItem.totQuantity;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      // trailing: IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       foodItem.carbs =
                      //           foodItem.carbs * foodItem.totQuantity;
                      //       foodItem.proteins =
                      //           foodItem.proteins * foodItem.proteins;
                      //       foodItem.calories = foodItem.calories;
                      //       foodItem.fats = foodItem.fats;
                      //     });
                      //   },
                      //   icon: const Icon(Icons.add),
                      // ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Food Nutrition details:',
                            style: TextStyle(color: Colors.tealAccent),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                foodItem.foodName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text('Category: ${foodItem.category}'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text('Quantity: ${foodItem.quantity}'),
                          const Gap(10),
                          Row(
                            //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  'Carbohydrates: ${foodItem.carbs.toStringAsFixed(5)}',),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  'Calories: ${foodItem.calories.toStringAsFixed(5)}',),
                              Text('Fats: ${foodItem.fats.toStringAsFixed(5)}'),
                            ],
                          ),
                          Row(children: [
                            Text(
                                'Proteins: ${foodItem.proteins.toStringAsFixed(5)}',),
                          ],),
                          Text(
                            "TOtal quantity:${foodItem.totQuantity.toString()}",
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
