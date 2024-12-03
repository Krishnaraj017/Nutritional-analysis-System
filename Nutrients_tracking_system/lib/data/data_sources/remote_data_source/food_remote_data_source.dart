import 'package:injectable/injectable.dart';
import 'package:statedemo/core/api/api_client.dart';
import 'package:statedemo/core/api/api_constant.dart';
import 'package:statedemo/data/models/fetch_food_response.dart';

abstract class FoodRemoteDataSource {
  Future<FetchFoodResponse> fetchFood({
    required Map<String, dynamic> params,
  });
  Future<FetchFoodResponse> searchFood({required Map<String, dynamic> params});
}

@LazySingleton(as: FoodRemoteDataSource)
class FoodRemoteDataSourceImpl extends FoodRemoteDataSource {
  final ApiClient _apiClient;
  FoodRemoteDataSourceImpl(this._apiClient);

  @override
  Future<FetchFoodResponse> fetchFood(
      {required Map<String, dynamic> params}) async {
    final response = await _apiClient.get(path: ApiConstants.fetchFood);
    return FetchFoodResponse.fromJson(response);
  }

  @override
  Future<FetchFoodResponse> searchFood(
      {required Map<String, dynamic> params}) async {
    String foodName = params['foodName'];

    final response =
        await _apiClient.get(path: ApiConstants.searchFood(foodName));
    return FetchFoodResponse.fromJson(response);
  }
}
