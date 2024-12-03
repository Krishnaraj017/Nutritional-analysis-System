import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:statedemo/core/api/api_call_with_error.dart';
import 'package:statedemo/data/data_sources/local_data_source/user_local_data_source.dart';
import 'package:statedemo/data/data_sources/remote_data_source/user_remote_data_source.dart';
import 'package:statedemo/data/models/generate_otp_response.dart';
import 'package:statedemo/data/models/hydration.dart';
import 'package:statedemo/data/models/reminders.dart';
import 'package:statedemo/data/models/sleep.dart';
import 'package:statedemo/data/models/user.dart';
import 'package:statedemo/data/models/verify_otp_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/entities/local_app_info.dart';
import 'package:statedemo/domain/entities/utils/hive_call_with_error.dart';
import 'package:statedemo/domain/repositories/user_repository.dart';

import '../data_sources/local_data_source/token_local_data_source.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;
  final TokenLocalDataSource _tokenLocalDataSource;

  UserRepositoryImpl(
    this._userRemoteDataSource,
    this._userLocalDataSource,
    this._tokenLocalDataSource,
  );

  @override
  Future<Either<AppError, GenerateOtpResponse>> generateOtp({
    required Map<String, dynamic> params,
  }) {
    return ApiCallWithError.call(
      () => _userRemoteDataSource.generateOtp(params: params),
    );
  }

  @override
  Future<Either<AppError, VerifyOtpResponse>> verifyOtp({
    required Map<String, dynamic> params,
  }) {
    return ApiCallWithError.call(() async {
      final res = await _userRemoteDataSource.verifyOtp(params: params);
      await Future.wait(
        [
          _tokenLocalDataSource.cacheAccessToken(res.token),
          _userLocalDataSource.cacheUser(user: res.user),
        ],
      );
      return res;
    });
  }

  @override
  Future<Either<AppError, User>> createProfile({
    required Map<String, dynamic> params,
  }) {
    return ApiCallWithError.call(
      () async {
        final res = await _userRemoteDataSource.createProfile(params: params);
        final user = res.copyWith(isOnboardingCompleted: true);
        await _userLocalDataSource.cacheUser(user: user);
        return res;
      },
    );
  }

  @override
  Future<Either<AppError, LocalAppInfo?>> getLocalAppInfo() async {
    return HiveCallWithError.call(() => _userLocalDataSource.getLocalAppInfo());
  }

  @override
  Future<Either<AppError, void>> updateLocalAppInfo({
    required LocalAppInfo localAppInfo,
  }) async {
    return HiveCallWithError.call(
      () => _userLocalDataSource.updateLocalAppInfo(localAppInfo: localAppInfo),
    );
  }

  @override
  Future<Either<AppError, User?>> getUser() {
    return HiveCallWithError.call(() => _userLocalDataSource.getUser());
  }

  @override
  Future<Either<AppError, VerifyOtpResponse>> socialLogin({
    required Map<String, dynamic> params,
  }) {
    return ApiCallWithError.call(() async {
      final res = await _userRemoteDataSource.socialLogin(params: params);

      await Future.wait(
        [
          _tokenLocalDataSource.cacheAccessToken(res.token),
          _userLocalDataSource.cacheUser(user: res.user),
        ],
      );
      return res;
    });
  }

  @override
  Future<Either<AppError, void>> logout() {
    return ApiCallWithError.call(() async {
      final Isar isar = Isar.getInstance()!;
      await Future.wait(
        [
          _tokenLocalDataSource.deleteAllTokens(),
          _userLocalDataSource.clearUser(),
          GoogleSignIn().signOut(),
          isar.writeTxn<bool>(() {
            isar.sleeps.clear();
            isar.hydrations.clear();
            isar.reminders.clear();
            return Future.value(true);
          }),
        ],
      );
    });
  }

  @override
  Future<Either<AppError, void>> updateProfile({
    required Map<String, dynamic> params,
  }) {
    return ApiCallWithError.call(() async {
      final res = await _userRemoteDataSource.updateProfile(params: params);
      final user = User.fromJson(params);
      await _userLocalDataSource.cacheUser(user: user);
      return res;
    });
  }

  @override
  Future<Either<AppError, void>> updateLocalUser({required User user}) {
    return HiveCallWithError.call(
      () => _userLocalDataSource.cacheUser(user: user),
    );
  }
}
