import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/data/data_sources/remote_data_source/weather_remote_data_source.dart';
import 'package:statedemo/data/models/weather_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/entities/enums.dart';
import 'package:statedemo/domain/repositories/weather_repository.dart';

import '../data_sources/local_data_source/weather_local_data_source.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _remoteDataSource;
  final WeatherLocalDataSource _localDataSource;

  WeatherRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<AppError, WeatherResponse>> getWeather(
    Map<String, dynamic> params,
  ) async {
    try {
      final res = await _remoteDataSource.getWeather(params);
      //TODO: Figure Caching logic

      // await _localDataSource.cacheWeather(res);
      return Right(res);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        final res = await _localDataSource.getWeather();
        if (res != null) {
          return Right(res);
        }

        if (e.type == DioExceptionType.unknown && e.error is SocketException) {
          final res = await _localDataSource.getWeather();
          if (res != null) {
            return Right(res);
          }
        }
      }
      return Left(AppError(message: e.message, errorType: ErrorType.api));
    }
  }
}
