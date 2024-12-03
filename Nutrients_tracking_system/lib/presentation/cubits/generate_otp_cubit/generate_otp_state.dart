import 'package:equatable/equatable.dart';
import 'package:statedemo/data/models/generate_otp_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';

abstract class GenerateOtpState extends Equatable {
  const GenerateOtpState();
}

class GenerateOtpInitial extends GenerateOtpState {
  @override
  List<Object?> get props => [];
}

class GenerateOtpLoading extends GenerateOtpState {
  @override
  List<Object?> get props => [];
}

class GenerateOtpSuccess extends GenerateOtpState {
  final GenerateOtpResponse generateOtpResponse;

  const GenerateOtpSuccess(this.generateOtpResponse);
  @override
  List<Object?> get props => [generateOtpResponse];
}

class GenerateOtpError extends GenerateOtpState {
  final AppError appError;

  const GenerateOtpError(this.appError);
  @override
  List<Object?> get props => [appError];
}
