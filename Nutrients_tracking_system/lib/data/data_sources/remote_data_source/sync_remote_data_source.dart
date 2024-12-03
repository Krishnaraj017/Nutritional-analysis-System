import 'package:injectable/injectable.dart';
import 'package:statedemo/core/api/api_client.dart';
import 'package:statedemo/data/models/last_7_days_data.dart';
import 'package:statedemo/utils/constants/api_constant.dart';

abstract class SyncRemoteDataSource {
  Future<void> syncAll(Map<String, dynamic> syncParams);

  Future<Last7DaysData> getLast7DaysData();
}

@LazySingleton(as: SyncRemoteDataSource)
class SyncRemoteDataSourceImpl implements SyncRemoteDataSource {
  final ApiClient _client;

  SyncRemoteDataSourceImpl(this._client);

  @override
  Future<void> syncAll(Map<String, dynamic> syncParams) async {
    return await _client.post(path: ApiConstants.syncAll, params: syncParams);
  }

  @override
  Future<Last7DaysData> getLast7DaysData() async {
    final response = await _client.get(path: ApiConstants.getLast7DaysData);
    if (response == null || response['data'] == null) {
      return Last7DaysData();
    }

    return Last7DaysData.fromJson(response['data']);
  }
}
