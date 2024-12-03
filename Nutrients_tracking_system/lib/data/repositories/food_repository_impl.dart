import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/core/api/api_call_with_error.dart';
import 'package:statedemo/data/data_sources/local_data_source/food_local_data_source.dart';
import 'package:statedemo/data/data_sources/remote_data_source/food_remote_data_source.dart';
import 'package:statedemo/data/models/fetch_food_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/repositories/food_repository.dart';

@LazySingleton(as: FoodRepository)
class FoodRepositoryImpl implements FoodRepository {
  final FoodRemoteDataSource _foodRemoteDataSource;
  final FoodLocalDataSource _foodLocalDataSource;
  FoodRepositoryImpl(this._foodRemoteDataSource, this._foodLocalDataSource);

  @override
  Future<Either<AppError, FetchFoodResponse>> fetchFood(
      {required Map<String, dynamic> params}) {
    return ApiCallWithError.call(
      () => _foodRemoteDataSource.fetchFood(params: params),
    );
  }

  @override
  Future<Either<AppError, FetchFoodResponse>> searchFood(
      {required Map<String, dynamic> params}) {
    return ApiCallWithError.call(
        () => _foodRemoteDataSource.searchFood(params: params));
  }


}
