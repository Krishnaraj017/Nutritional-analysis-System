import 'package:json_annotation/json_annotation.dart';

part 'generate_otp_response.g.dart';

@JsonSerializable()
class GenerateOtpResponse {
  final String message;
  final String token;


  GenerateOtpResponse(this.message, this.token);

  factory GenerateOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateOtpResponseToJson(this);
}
