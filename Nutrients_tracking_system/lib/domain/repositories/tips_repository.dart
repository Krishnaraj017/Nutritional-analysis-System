import 'package:dartz/dartz.dart';
import 'package:statedemo/data/models/tips.dart';
import 'package:statedemo/domain/entities/app_error.dart';

abstract class TipsRepository {
  Future<Either<AppError, Tips>> getTips(Map<String, dynamic> params);

}
