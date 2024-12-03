import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:statedemo/data/models/food_item.dart';
import 'package:statedemo/domain/entities/enums.dart';
import 'package:statedemo/domain/entities/params/fetch_food_params.dart';
import 'package:statedemo/domain/repositories/food_repository.dart';
import 'package:statedemo/presentation/cubits/food_cubit/food_state.dart';

@injectable
class FoodCubit extends Cubit<FoodState> {
  final FoodRepository _foodRepository;
  MealType selectedMeal=MealType.breakfast;

  final Isar _isar = Isar.getInstance()!;
  late MealType selectedMealType;
  FoodCubit(this._foodRepository) : super(FoodInitialState());
  Future<void> fetchFood() async {
    final response =
        await _foodRepository.fetchFood(params: FetchFoodParams().toJson());
    response.fold(
      (l) => FoodErrorState(l),
      (r) => emit(
        FoodLoadedState(r),
      ),
    );
  }

  void selectMealType(MealType mealType) {
    selectedMeal = mealType;
  }

  void toggleFoodSelection(FoodItem foodItem) {
    foodItem.isSelected = !foodItem.isSelected;

    print(foodItem);
    emit(
      FoodLoadedState((state as FoodLoadedState).fetchFoodResponse),
    ); // Emit updated food items
  }

  void unToggleFoodSelection(FoodItem foodItem) {
    foodItem.isSelected = !foodItem.isSelected;
    //print(foodItem);
    emit(FoodLoadedState((state as FoodLoadedState).fetchFoodResponse));
  }

  void addSelectedFoodItems() {
    final selectedFoodItems = (state as FoodLoadedState)
        .fetchFoodResponse
        .result
        .where((foodItem) => foodItem.isSelected)
        .toList();
    for (final foodItem in selectedFoodItems) {
      addFood(foodItem: foodItem, mealType: selectedMeal);
    }
  }

  void addFood({
    required FoodItem foodItem,
    required MealType mealType,
  }) async {
    foodItem.mealType = selectedMeal;
    await _isar.writeTxn(() => _isar.foodItems.put(foodItem));
  }
}
