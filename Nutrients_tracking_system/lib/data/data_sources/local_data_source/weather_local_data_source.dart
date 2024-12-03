import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/data/models/weather_response.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherResponse?> getWeather();

  Future<void> cacheWeather(WeatherResponse weatherResponse);
}

@LazySingleton(as: WeatherLocalDataSource)
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  @override
  Future<void> cacheWeather(WeatherResponse weatherResponse) async {
    final box = await Hive.openBox('weather');
    final weatherString = weatherResponse.toJson();
    await box.put('weather', weatherString);
  }

  @override
  Future<WeatherResponse?> getWeather() async {
    final box = await Hive.openBox('weather');
    final weatherString = box.get('weather');
    if (weatherString != null) {
      final weatherMap = Map<String, dynamic>.from(weatherString);
      return WeatherResponse.fromJson(weatherMap);
    }
    return null;
  }
}
