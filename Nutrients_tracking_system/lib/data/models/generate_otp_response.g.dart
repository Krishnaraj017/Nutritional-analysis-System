// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateOtpResponse _$GenerateOtpResponseFromJson(Map<String, dynamic> json) =>
    GenerateOtpResponse(
      json['message'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$GenerateOtpResponseToJson(
        GenerateOtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
