// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:statedemo/data/models/food_item.dart';
// import 'package:statedemo/di/get_it.dart';
// import 'package:statedemo/domain/entities/enums.dart';
// import 'package:statedemo/gen/assets.gen.dart';
// import 'package:statedemo/presentation/cubits/food_cubit/food_cubit.dart';
// import 'package:statedemo/presentation/cubits/food_cubit/food_state.dart';
// import 'package:statedemo/presentation/routes/app_router.dart';
// import 'package:statedemo/presentation/theme/theme_extension.dart';

// @RoutePage()
// class SearchMealScreen extends StatefulWidget implements AutoRouteWrapper {
//   final MealType selectedMealType;
//   const SearchMealScreen({super.key, required this.selectedMealType});

//   @override
//   _SearchMealScreenState createState() => _SearchMealScreenState();
//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => getIt<FoodCubit>()..fetchFood(),
//         ),
//       ],
//       child: this,
//     );
//   }
// }

// class _SearchMealScreenState extends State<SearchMealScreen> {
//   @override
//   Widget build(BuildContext context) {
//     int totQuant = 1;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Select meal now',
//           style: TextStyle(fontSize: 22),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Container(
//               //width: 330,
//               height: 60,
//               decoration: ShapeDecoration(
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 shadows: const [
//                   BoxShadow(
//                     color: Color(0x19040404),
//                     blurRadius: 20,
//                     offset: Offset(0, 2),
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         // context.read<FoodCubit>().searchFood(foodName: _textEditController.text);
//                       },
//                       child: Assets.svgs.search.svg(),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Handle the click action for the first search icon here
//                       },
//                       child: Assets.svgs.scan.svg(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: BlocBuilder<FoodCubit, FoodState>(
//               builder: (context, state) {
//                 if (state is FoodLoadedState) {
//                   return Container(
//                     decoration: ShapeDecoration(
//                       color: const Color(0xFFF4F4F4),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       shadows: const [
//                         BoxShadow(
//                           color: Color(0x19040404),
//                           blurRadius: 20,
//                           offset: Offset(2, 2),
//                           spreadRadius: 0,
//                         ),
//                       ],
//                     ),
//                     child: ListView.builder(
//                       itemCount: state.fetchFoodResponse.result.length,
//                       itemBuilder: (context, index) {
//                         final foodItem = state.fetchFoodResponse.result[index];
//                         bool isChecked = false;

//                         return Padding(
//                           padding: const EdgeInsets.only(left: 15),
//                           child: Row(
//                             children: [
//                               StatefulBuilder(
//                                 builder: (context, setState) {
//                                   return Checkbox(
//                                     value: foodItem.isSelected,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         isChecked = value ?? false;
//                                       });
//                                       if (value ?? false) {
//                                         context
//                                             .read<FoodCubit>()
//                                             .toggleFoodSelection(foodItem);

//                                         // Handling checkbox change
//                                       } else {
//                                         context
//                                             .read<FoodCubit>()
//                                             .unToggleFoodSelection(foodItem);
//                                         //print("removed ${foodItem.name}");
//                                       }
//                                     },
//                                     activeColor: Colors.green,
//                                   );
//                                 },
//                               ),
//                               const Gap(2),
//                               // const VerticalDivider(
//                               //     width: 2, color: Colors.black, thickness: 2),
//                               const Gap(2),
//                               Expanded(
//                                 child: ListTile(
//                                   key: ValueKey(foodItem), // Add this line
//                                   title: Text(foodItem.name),
//                                   subtitle: Text(
//                                     ' ${foodItem.calories},${foodItem.quantity},${foodItem.catogory}',
//                                   ),
//                                   onTap: () {},
//                                   trailing: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       IconButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             foodItem.totQuantity += 1;

//                                             // totQuant += 1;
//                                           });
//                                         },
//                                         icon: const Icon(Icons.add),
//                                       ),
//                                       Text(foodItem.totQuantity.toString()),
//                                       IconButton(
//                                         onPressed: () {
//                                           if (foodItem.totQuantity > 1) {
//                                             setState(() {
//                                               foodItem.totQuantity -= 1;
//                                             });
//                                           }
//                                           // context
//                                           //     .read<FoodCubit>()
//                                           //     .decreaseQuant(foodItem);
//                                         },
//                                         icon: const Icon(Icons.remove),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 }
//                 return const CircularProgressIndicator();
//               },
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               context.read<FoodCubit>().selectMealType(widget.selectedMealType);
//               context.read<FoodCubit>().addSelectedFoodItems();
//               context.router.push(const MealDetailsRoute());
//             },
//             child: Container(
//               //width: 390,
//               width: double.infinity,
//               height: 87,
//               decoration: ShapeDecoration(
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 shadows: const [
//                   BoxShadow(
//                     color: Color(0x19040404),
//                     blurRadius: 20,
//                     offset: Offset(2, 2),
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Text(
//                   'Confirm',
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.h3Small,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
