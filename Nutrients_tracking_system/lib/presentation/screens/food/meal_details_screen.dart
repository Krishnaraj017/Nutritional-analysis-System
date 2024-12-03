// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:statedemo/data/models/food_item.dart';
// import 'package:statedemo/di/get_it.dart';
// import 'package:statedemo/domain/entities/enums.dart';
// import 'package:statedemo/presentation/cubits/food_cubit/food_cubit.dart';
// import 'package:statedemo/presentation/cubits/food_daily_cubit.dart/food_daily_cubit.dart';
// import 'package:statedemo/presentation/cubits/food_daily_cubit.dart/food_daily_state.dart';
// import 'package:statedemo/presentation/routes/app_router.dart';
// import 'package:statedemo/presentation/screens/food/widgets/option_alert_dialog.dart';
// import 'package:statedemo/presentation/theme/app_colors.dart';
// import 'package:statedemo/presentation/theme/theme_extension.dart';

// @RoutePage()
// class MealDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
//   const MealDetailsScreen({super.key});

//   @override
//   _MealDetailsScreenState createState() => _MealDetailsScreenState();
//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => getIt<FoodCubit>(),
//         ),
//         BlocProvider(create: (_) => getIt<FoodDailyCubit>()..getFoods()),
//       ],
//       child: this,
//     );
//   }
// }

// class _MealDetailsScreenState extends State<MealDetailsScreen> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     context.read<FoodDailyCubit>().getFoods();

//     MealType selectedMealType;
//     void readMealType(MealType mealType) {
//       selectedMealType = mealType;
//       // context.read<FoodCubit>().selectMealType(mealType);
//     }

//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title:
//               const Text('Your Meal Details', style: TextStyle(fontSize: 22)),
//           bottom: TabBar(
//             onTap: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             tabs: const [
//               Tab(text: 'Breakfast'),
//               Tab(text: 'Lunch'),
//               Tab(text: 'Dinner'),
//             ],
//             indicator: BoxDecoration(
//               color: Colors.blue[200],
//               borderRadius: BorderRadius.circular(22),
//             ),
//             labelStyle: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//             labelColor: Colors.black,
//             unselectedLabelStyle: const TextStyle(
//               fontSize: 16,
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             IndexedStack(
//               index: _currentIndex,
//               children: const [
//                 BreakfastScreen(),
//                 LunchScreen(),
//                 DinnerScreen(),
//               ],
//             ),
//             GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return OptionAlertDialog(
//                       onMealTypeSelected: (mealType) {
//                         readMealType(mealType);
//                         print('Selected meal type: $mealType');
//                       },
//                     );
//                   },
//                 );
//                 //  context.router.push(const SearchMealRoute());
//               },
//               child: Container(
//                 width: 150,
//                 height: 41,
//                 decoration: ShapeDecoration(
//                   gradient: const LinearGradient(
//                     begin: Alignment(0.00, -1.00),
//                     end: Alignment(0, 1),
//                     colors: AppColors.gradientColors,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     //const Gap(17),
//                     Text(
//                       'Enter Meal',
//                       style: Theme.of(context)
//                           .textTheme
//                           .largeTextMedium
//                           .apply(color: Colors.white),
//                     ),
//                     const Icon(
//                       Icons.add,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BreakfastScreen extends StatelessWidget {
//   const BreakfastScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: SizedBox(
//           height: 500,
//           child: BlocBuilder<FoodDailyCubit, FoodDailyState>(
//             builder: (context, state) {
//               if (state is FoodDailyLoaded) {
//                 var breakFastItem = state.foodItem
//                     .where(
//                         (foodItem) => foodItem.mealType == MealType.breakfast)
//                     .toList();

//                 // Display the list of food items
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: breakFastItem.length,
//                   itemBuilder: (context, index) {
//                     FoodItem foodItem = breakFastItem[index];
//                     return SizedBox(
//                       width: double.infinity,
//                       height: 160,
//                       child: Card(
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                     //  width: 35,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: AppColors.secondaryColor,
//                                     ),
//                                     child: Text(foodItem.catogory)),
//                                 Container(
//                                     //  width: 35,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: AppColors.secondaryColor,
//                                     ),
//                                     child: Text(foodItem.quantity)),
//                               ],
//                             ),
//                             Text(foodItem.name),
//                             Text("Quantity: ${foodItem.totQuantity}"),
//                             Gap(10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text("Carbohydrates:${foodItem.carbohydrates}"),
//                                 Text("Proteins:${foodItem.proteins}"),
//                               ],
//                             ),
//                             Gap(20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text("Calories:${foodItem.calories}"),
//                                 Text("fats:${foodItem.fats}"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 // Show a loading indicator or handle error state
//                 return const CircularProgressIndicator();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LunchScreen extends StatelessWidget {
//   const LunchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: SizedBox(
//           height: 500,
//           child: BlocBuilder<FoodDailyCubit, FoodDailyState>(
//             builder: (context, state) {
//               if (state is FoodDailyLoaded) {
//                 var lunchItem = state.foodItem
//                     .where((foodItem) => foodItem.mealType == MealType.lunch)
//                     .toList();
//                 // Display the list of food items
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: lunchItem.length,
//                   itemBuilder: (context, index) {
//                     FoodItem foodItem = lunchItem[index];
//                     return SizedBox(
//                       width: double.infinity,
//                       height: 160,
//                       child: Card(
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                     //  width: 35,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: AppColors.secondaryColor,
//                                     ),
//                                     child: Text(foodItem.catogory)),
//                                 Container(
//                                     //  width: 35,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: AppColors.secondaryColor,
//                                     ),
//                                     child: Text(foodItem.quantity)),
//                               ],
//                             ),
//                             Text(foodItem.name),
//                             Text("Quantity: ${foodItem.totQuantity}"),
//                             Gap(10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text("Carbohydrates:${foodItem.carbohydrates}"),
//                                 Text("Proteins:${foodItem.proteins}"),
//                               ],
//                             ),
//                             Gap(20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text("Calories:${foodItem.calories}"),
//                                 Text("fats:${foodItem.fats}"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 // Show a loading indicator or handle error state
//                 return const CircularProgressIndicator();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DinnerScreen extends StatelessWidget {
//   const DinnerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: SizedBox(
//           height: 500,
//           child: BlocBuilder<FoodDailyCubit, FoodDailyState>(
//             builder: (context, state) {
//               if (state is FoodDailyLoaded) {
//                 var dinnerItem = state.foodItem
//                     .where((foodItem) => foodItem.mealType == MealType.dinner)
//                     .toList();
//                 // Display the list of food items
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: dinnerItem.length,
//                   itemBuilder: (context, index) {
//                     FoodItem foodItem = dinnerItem[index];
//                     return SizedBox(
//                       width: double.infinity,
//                       height: 160,
//                       child: Card(
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                     //  width: 35,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: AppColors.secondaryColor,
//                                     ),
//                                     child: Text(foodItem.catogory)),
//                                 Container(
//                                     //  width: 35,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: AppColors.secondaryColor,
//                                     ),
//                                     child: Text(foodItem.quantity)),
//                               ],
//                             ),
//                             Text(foodItem.name),
//                             Text("Quantity: ${foodItem.totQuantity}"),
//                             Gap(10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text("Carbohydrates:${foodItem.carbohydrates}"),
//                                 Text("Proteins:${foodItem.proteins}"),
//                               ],
//                             ),
//                             Gap(20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text("Calories:${foodItem.calories}"),
//                                 Text("fats:${foodItem.fats}"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 // Show a loading indicator or handle error state
//                 return const CircularProgressIndicator();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
