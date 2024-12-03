import 'package:dartz/dartz.dart';
import 'package:statedemo/data/models/fetch_food_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';

abstract class FoodRepository {
  Future<Either<AppError, FetchFoodResponse>> fetchFood({
    required Map<String, dynamic> params,
  });
  Future<Either<AppError, FetchFoodResponse>> searchFood({
    required Map<String, dynamic> params,
  });
}
