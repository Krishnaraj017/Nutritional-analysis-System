import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: Theme.of(context).rosetteCardDecoration,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Food',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.regularSmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const Icon(
                  Icons.food_bank,
                  size: 20,
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                context.router.push(FoodRoute());
              },
              child: Text("Add Food"))
        ],
      ),
    );
  }
}
