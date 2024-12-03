import 'package:dartz/dartz.dart';
import 'package:statedemo/data/models/weather_response.dart';
import 'package:statedemo/domain/entities/app_error.dart';

abstract class WeatherRepository {
  Future<Either<AppError, WeatherResponse>> getWeather(
    Map<String, dynamic> params,
  );
}
