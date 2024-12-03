import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/core/api/auth_interceptor.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }

  dynamic post({
    required String path,
    Map<String, dynamic>? params,
    bool requiresToken = true,
  }) async {
    var response = await _dio.post(
      path,
      data: params,
      options: Options(
        headers: {'requiresToken': requiresToken},
      ),
    );
    return response.data;
  }

  dynamic get({
    required String path,
    Map<String, dynamic>? params,
    bool requiresToken = true,
    String? baseUrl,
  }) async {
    var response = await _dio.get(
      baseUrl == null ? path : baseUrl + path,
      queryParameters: params,
      options: Options(
        headers: {'requiresToken': requiresToken},
      ),
    );
    return response.data;
  }

  dynamic fileUpload({
    required String path,
    required FormData formData,
    bool requiresToken = true,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    var response = await _dio.post(
      path,
      data: formData,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      options: Options(
        headers: {'requiresToken': requiresToken},
      ),
    );
    return response.data;
  }
}
