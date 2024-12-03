import 'package:equatable/equatable.dart';
import 'package:statedemo/data/models/verify_otp_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';

abstract class VerifyOtpState extends Equatable {}

class VerifyOtpInitial extends VerifyOtpState {
  @override
  List<Object?> get props => [];
}

class VerifyOtpLoading extends VerifyOtpState {
  @override
  List<Object?> get props => [];
}

class VerifyOtpSuccess extends VerifyOtpState {
  final VerifyOtpResponse verifyOtpResponse;

  VerifyOtpSuccess(this.verifyOtpResponse);
  @override
  List<Object?> get props => [verifyOtpResponse];
}

class VerifyOtpError extends VerifyOtpState {
  final AppError appError;

  VerifyOtpError(this.appError);

  @override
  List<Object?> get props => [appError];
}
