import 'package:equatable/equatable.dart';
import 'package:statedemo/data/models/fetch_food_response.dart';
import 'package:statedemo/data/models/food_item.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/entities/enums.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class FoodInitialState extends FoodState {
  @override
  List<Object?> get props => [];
}

class FoodLoadedState extends FoodState {
  final FetchFoodResponse fetchFoodResponse;
  const FoodLoadedState(this.fetchFoodResponse);

  @override
  List<Object?> get props => [fetchFoodResponse];
}



class FoodErrorState extends FoodState {
  final AppError appError;
  const FoodErrorState(this.appError);
  @override
  List<Object?> get props => [appError];
}
