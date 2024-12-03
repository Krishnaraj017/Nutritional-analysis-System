import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/entities/enums.dart';

class HiveCallWithError {
  HiveCallWithError._();

  static Future<Either<AppError, T?>> call<T>(Future<T?> Function() f) async {
    try {
      return Right(await f());
    } on HiveError catch (e) {
      return Left(AppError(message: e.message, errorType: ErrorType.hiveError));
    } on TypeError catch (e) {
      return Left(
          AppError(message: e.toString(), errorType: ErrorType.hiveTypeError),);
    } catch (e) {
      return Left(
          AppError(message: e.toString(), errorType: ErrorType.unknown),);
    }
  }
}
