import 'package:injectable/injectable.dart';
import 'package:statedemo/core/api/api_client.dart';
import 'package:statedemo/data/models/generate_otp_response.dart';
import 'package:statedemo/data/models/user.dart';
import 'package:statedemo/data/models/verify_otp_response.dart';
import 'package:statedemo/utils/constants/api_constant.dart';

abstract class UserRemoteDataSource {
  Future<GenerateOtpResponse> generateOtp({
    required Map<String, dynamic> params,
  });

  Future<VerifyOtpResponse> verifyOtp({required Map<String, dynamic> params});

  Future<User> createProfile({required Map<String, dynamic> params});

  Future<void> updateProfile({required Map<String, dynamic> params});

  Future<VerifyOtpResponse> socialLogin({required Map<String, dynamic> params});
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final ApiClient _apiClient;

  UserRemoteDataSourceImpl(this._apiClient);

  @override
  Future<GenerateOtpResponse> generateOtp({
    required Map<String, dynamic> params,
  }) async {
    final response = await _apiClient.post(
      path: ApiConstants.sendOtp,
      params: params,
      requiresToken: false,
    );
    return GenerateOtpResponse.fromJson(response);
  }

  @override
  Future<VerifyOtpResponse> verifyOtp({
    required Map<String, dynamic> params,
  }) async {
    var response = await _apiClient.post(
      path: ApiConstants.checkOtp,
      params: params,
      requiresToken: false,
    );
    return VerifyOtpResponse.fromJson(response);
  }

  @override
  Future<User> createProfile({required Map<String, dynamic> params}) async {
    var response =
        await _apiClient.post(path: ApiConstants.createProfile, params: params);
    return User.fromJson(response);
  }

  @override
  Future<VerifyOtpResponse> socialLogin({
    required Map<String, dynamic> params,
  }) async {
    var response = await _apiClient.post(
      path: ApiConstants.socialLogin,
      params: params,
      requiresToken: false,
    );
    return VerifyOtpResponse.fromJson(response);
  }

  @override
  Future<void> updateProfile({required Map<String, dynamic> params}) async {
    await _apiClient.post(path: ApiConstants.updateProfile, params: params);
  }
}
