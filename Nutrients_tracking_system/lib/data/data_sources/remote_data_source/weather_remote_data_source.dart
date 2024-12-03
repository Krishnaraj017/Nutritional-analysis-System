import 'package:injectable/injectable.dart';
import 'package:statedemo/data/models/weather_response.dart';

import '../../../core/api/api_client.dart';
import '../../../utils/constants/api_constant.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherResponse> getWeather(Map<String, dynamic> params);
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient _client;

  WeatherRemoteDataSourceImpl(this._client);

  @override
  Future<WeatherResponse> getWeather(Map<String, dynamic> params) async {
    final res = await _client.get(
      path: ApiConstants.getCurrentWeather,
      params: params,
      requiresToken: false,
      baseUrl: ApiConstants.weatherBaseUrl,
    );
    return WeatherResponse.fromJson(res);
  }
}
