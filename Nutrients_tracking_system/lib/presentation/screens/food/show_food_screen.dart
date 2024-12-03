import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:isar/isar.dart';
import 'package:statedemo/presentation/screens/food/model/food_items.dart';

@RoutePage()
class ShowFoodScreen extends StatefulWidget {
  const ShowFoodScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ShowFoodScreenState createState() => _ShowFoodScreenState();
}

class _ShowFoodScreenState extends State<ShowFoodScreen> {
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
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                // Decrement the total quantity by 1
                                foodItem.totQuantity -= 1;

                                // Update the totQuantity in the Isar database within a write transaction
                                _isar.writeTxn(
                                  () => _isar.foodItems.put(foodItem),
                                );
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(foodItem.totQuantity.toString()),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                // Increment the total quantity by 1
                                foodItem.totQuantity += 1;

                                // Update the totQuantity in the Isar database within a write transaction
                                _isar.writeTxn(
                                  () => _isar.foodItems.put(foodItem),
                                );
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Food Nutrition details:',
                            style: TextStyle(color: Colors.tealAccent),
                          ),
                          Text(
                            foodItem.foodName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Text('Quantity: ${foodItem.quantity}'),
                          const Gap(10),
                          Text('Carbohydrates: ${foodItem.carbs}'),
                          const Gap(10),
                          Text('Calories: ${foodItem.calories}'),
                          Text('Fats: ${foodItem.fats}'),
                          Text('Proteins: ${foodItem.proteins}'),
                          Text(
                              "Total quantity:${foodItem.totQuantity.toString()}"),
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
