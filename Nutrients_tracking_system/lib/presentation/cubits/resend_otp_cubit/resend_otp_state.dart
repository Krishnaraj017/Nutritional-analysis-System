import 'package:equatable/equatable.dart';
import 'package:statedemo/data/models/generate_otp_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';

abstract class ResendOtpState extends Equatable {}

class ResendOtpInitialState extends ResendOtpState {
  @override
  List<Object?> get props => [];
}

class ResendOtpLoadingState extends ResendOtpState {
  @override
  List<Object?> get props => [];
}

class ResendOtpSuccessState extends ResendOtpState {
  final GenerateOtpResponse generateOtpResponse;
  ResendOtpSuccessState(this.generateOtpResponse);
  @override
  List<Object?> get props => [generateOtpResponse];
}

class ResendOtpErrorState extends ResendOtpState {
  final AppError appError;
  ResendOtpErrorState(this.appError);
  @override
  List<Object?> get props => [appError];
}
