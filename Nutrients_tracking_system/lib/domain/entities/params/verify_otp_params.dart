import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_params.g.dart';

@JsonSerializable()
class VerifyOtpParams {
  final String otp;
  final String userEmail;
  final String token;

  VerifyOtpParams(
      {required this.otp, required this.userEmail, required this.token,});

  factory VerifyOtpParams.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpParamsFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpParamsToJson(this);
}
