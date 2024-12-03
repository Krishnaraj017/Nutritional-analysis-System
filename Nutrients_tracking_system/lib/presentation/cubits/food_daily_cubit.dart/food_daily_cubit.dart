// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:isar/isar.dart';
// import 'package:statedemo/data/models/food_item.dart';
// import 'package:statedemo/domain/entities/enums.dart';
// import 'package:statedemo/domain/repositories/food_repository.dart';
// import 'package:statedemo/presentation/cubits/food_daily_cubit.dart/food_daily_state.dart';

// @injectable
// class FoodDailyCubit extends Cubit<FoodDailyState> {
//   FoodRepository _foodRepository;
//   FoodDailyCubit(this._foodRepository) : super(FoodDailyInitial());
//   final Isar _isar = Isar.getInstance()!;

//   void getFoods() async {
//     var foodItem = await _isar.foodItems.where().findAll();
//     //print(foodItem);

//     emit(FoodDailyLoaded(foodItem));
//   }

//   void getBreakFastItems() {
//     var foodItem = (state as FoodDailyLoaded)
//         .foodItem
//         .where((foodItem) => foodItem.mealType == MealType.breakfast)
//         .toList();
    
//     emit(FoodBreakFastLoaded(foodItem));
//   }

//   void getLunchItems() {
//     var foodItem = (state as FoodDailyLoaded)
//         .foodItem
//         .where((foodItem) => foodItem.mealType == MealType.lunch)
//         .toList();
//     emit(FoodLunchLoaded(foodItem));
//   }

//   void getDinnerItems() {
//     var foodItem = (state as FoodDailyLoaded)
//         .foodItem
//         .where((foodItem) => foodItem.mealType == MealType.dinner)
//         .toList();
//     emit(FoodDinnerLoaded(foodItem));
//   }
// }
