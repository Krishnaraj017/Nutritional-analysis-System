import 'package:json_annotation/json_annotation.dart';

part 'generate_otp_params.g.dart';

@JsonSerializable()
class GenerateOtpParams {
  final String userEmail;
  GenerateOtpParams({required this.userEmail});

  factory GenerateOtpParams.fromJson(Map<String, dynamic> json) =>
      _$GenerateOtpParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateOtpParamsToJson(this);
}
