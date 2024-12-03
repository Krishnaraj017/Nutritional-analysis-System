import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/utils/constants/api_constant.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          contentType: Headers.jsonContentType,
          baseUrl: ApiConstants.basePath,
          connectTimeout: const Duration(milliseconds: 60 * 1000),
          receiveTimeout: const Duration(milliseconds: 60 * 1000),
          sendTimeout: const Duration(milliseconds: 30 * 1000),
        ),
      );
}
