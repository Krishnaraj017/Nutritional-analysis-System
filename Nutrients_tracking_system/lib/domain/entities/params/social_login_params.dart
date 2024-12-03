//{
//     "userEmail":"shashanksmayya@gmail.com",
//     "token":"rosette9620373438"
// }

import 'package:json_annotation/json_annotation.dart';

part 'social_login_params.g.dart';

@JsonSerializable()
class SocialLoginParams {
  final String userEmail;
  @JsonKey(includeToJson: true)
  final String token = "rosette9620373438";

  SocialLoginParams({
    required this.userEmail,
  });

  factory SocialLoginParams.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLoginParamsToJson(this);
}
