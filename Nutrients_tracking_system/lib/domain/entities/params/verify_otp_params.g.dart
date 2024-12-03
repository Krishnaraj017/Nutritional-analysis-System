// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpParams _$VerifyOtpParamsFromJson(Map<String, dynamic> json) =>
    VerifyOtpParams(
      otp: json['otp'] as String,
      userEmail: json['userEmail'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$VerifyOtpParamsToJson(VerifyOtpParams instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'userEmail': instance.userEmail,
      'token': instance.token,
    };
