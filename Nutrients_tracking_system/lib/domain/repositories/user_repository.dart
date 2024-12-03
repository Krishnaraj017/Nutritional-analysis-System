import 'package:dartz/dartz.dart';
import 'package:statedemo/data/models/generate_otp_response.dart';
import 'package:statedemo/data/models/user.dart';
import 'package:statedemo/data/models/verify_otp_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/entities/local_app_info.dart';

abstract class UserRepository {
  Future<Either<AppError, GenerateOtpResponse>> generateOtp({
    required Map<String, dynamic> params,
  });

  Future<Either<AppError, VerifyOtpResponse>> verifyOtp({
    required Map<String, dynamic> params,
  });

  Future<Either<AppError, User>> createProfile({
    required Map<String, dynamic> params,
  });

  Future<Either<AppError, void>> updateProfile({
    required Map<String, dynamic> params,
  });

  Future<Either<AppError, void>> updateLocalUser({
    required User user,
  });

  Future<Either<AppError, User?>> getUser();

  Future<Either<AppError, LocalAppInfo?>> getLocalAppInfo();

  Future<Either<AppError, void>> updateLocalAppInfo({
    required LocalAppInfo localAppInfo,
  });

  Future<Either<AppError, VerifyOtpResponse>> socialLogin({
    required Map<String, dynamic> params,
  });

  Future<Either<AppError, void>> logout();
}
