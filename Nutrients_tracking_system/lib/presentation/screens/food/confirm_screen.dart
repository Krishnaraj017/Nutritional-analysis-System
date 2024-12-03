import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/di/get_it.dart';
import 'package:statedemo/presentation/cubits/food_cubit/food_cubit.dart';
import 'package:statedemo/presentation/cubits/food_cubit/food_state.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

@RoutePage()
class ConfirmScreen extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FoodCubit>(),
        ),
      ],
      child: this,
    );
  }

  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log Meal',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(10),
          Center(
            child: Text(
              'Breakfast',
              style: TextStyle(fontSize: 26),
            ),
          ),
          BlocBuilder<FoodCubit, FoodState>(
            builder: (context, state) {
              if (state is FoodLoadedState) {
                final selectedFoodItems = state.fetchFoodResponse.result;
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: selectedFoodItems.length,
                        itemBuilder: (context, index) {
                          final foodItem = selectedFoodItems[index];
                          return ListTile(
                            trailing: IconButton(
                              onPressed: () {
                                foodItem.totQuantity += 1;
                              },
                              icon: const Icon(Icons.add),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    foodItem.name,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                                'Calories: ${foodItem.calories.toString()}, totQuantity: ${foodItem.totQuantity.toString()}'),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('confirm'),
                    )
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
