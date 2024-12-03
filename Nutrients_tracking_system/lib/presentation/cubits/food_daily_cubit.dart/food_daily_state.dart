// import 'package:equatable/equatable.dart';
// import 'package:statedemo/data/models/food_item.dart';
// import 'package:statedemo/domain/entities/app_error.dart';

// abstract class FoodDailyState extends Equatable {
//   const FoodDailyState();
// }

// class FoodDailyInitial extends FoodDailyState {
//   @override
//   List<Object?> get props => [];
// }

// class FoodDailyLoaded extends FoodDailyState {
//   final List<FoodItem> foodItem;
//   const FoodDailyLoaded(this.foodItem);

//   @override
//   List<Object?> get props => [foodItem];
// }

// class FoodBreakFastLoaded extends FoodDailyState {
//   final List<FoodItem> foodItem;
//   const FoodBreakFastLoaded(this.foodItem);
//   @override
//   List<Object?> get props => [foodItem];
// }

// class FoodLunchLoaded extends FoodDailyState {
//   final List<FoodItem> foodItem;
//   const FoodLunchLoaded(this.foodItem);
//   @override
//   List<Object?> get props => [foodItem];
// }

// class FoodDinnerLoaded extends FoodDailyState {
//   final List<FoodItem> foodItem;
//   const FoodDinnerLoaded(this.foodItem);
//   @override
//   List<Object?> get props => [foodItem];
// }

// class FoodDailyError extends FoodDailyState {
//   final AppError appError;
//   const FoodDailyError(this.appError);
//   @override
//   List<Object?> get props => [appError];
// }
