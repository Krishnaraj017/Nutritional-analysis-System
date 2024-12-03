import 'package:injectable/injectable.dart';
import 'package:statedemo/core/api/api_client.dart';
import 'package:statedemo/data/models/tips.dart';

import '../../../utils/constants/api_constant.dart';

abstract class TipsRemoteDataSource {
  Future<Tips> getTips(Map<String, dynamic> params);
}

@LazySingleton(as: TipsRemoteDataSource)
class TipsRemoteDataSourceImpl extends TipsRemoteDataSource {
  final ApiClient _apiClient;

  TipsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Tips> getTips(Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(path: ApiConstants.getTip, params: params);
    return Tips.fromJson(response);
  }
}
