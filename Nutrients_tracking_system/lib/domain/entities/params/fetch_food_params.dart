import 'package:json_annotation/json_annotation.dart';

part 'fetch_food_params.g.dart';

@JsonSerializable()
class FetchFoodParams {
  FetchFoodParams();

  factory FetchFoodParams.fromJson(Map<String, dynamic> json) =>
      _$FetchFoodParamsFromJson(json);

  Map<String, dynamic> toJson() => _$FetchFoodParamsToJson(this);
}
