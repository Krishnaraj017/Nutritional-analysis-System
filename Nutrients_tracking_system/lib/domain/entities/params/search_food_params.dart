import 'package:json_annotation/json_annotation.dart';

part 'search_food_params.g.dart';

@JsonSerializable()
class SearchFoodParams {
    final String foodName;


  SearchFoodParams({required this.foodName});

  factory SearchFoodParams.fromJson(Map<String, dynamic> json) =>
      _$SearchFoodParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFoodParamsToJson(this);
}
