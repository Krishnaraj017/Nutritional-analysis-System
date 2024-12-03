import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:statedemo/data/models/user.dart';

part 'verify_otp_response.g.dart';

@JsonSerializable()
class VerifyOtpResponse {
  final String? message;
  final String token;
  final User user;

  VerifyOtpResponse({
    this.message,
    required this.token,
    required this.user,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseToJson(this);
}
