import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/core/api/api_call_with_error.dart';
import 'package:statedemo/data/data_sources/remote_data_source/tips_remote_data_source.dart';
import 'package:statedemo/data/models/tips.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/repositories/tips_repository.dart';

@LazySingleton(as: TipsRepository)
class TipsRepositoryImp extends TipsRepository {
  final TipsRemoteDataSource _tipsRemoteDataSource;

  TipsRepositoryImp(this._tipsRemoteDataSource);
  @override
  Future<Either<AppError, Tips>> getTips(Map<String, dynamic> params) {
    return ApiCallWithError.call(
      () => _tipsRemoteDataSource.getTips(params),
    );
  }
}
