class ApiConstants {
  ApiConstants._();
  static const String basePath = 'https://rosettebackend-one.vercel.app/api';
  static const String sendOtp = '/user/getin';
  static const String checkOtp = '/user/checkOtp';
  static const String createProfile = '/details/inputbasics';
  static const String updateProfile = '/details/updatebasics';
  static const String socialLogin = '/user/googlelogin';

  static const String weatherBaseUrl = "https://api.weatherapi.com/v1";
  static const String getCurrentWeather = "/current.json";
  static const String getTip = '/details/tip';

  static const String syncAll = '/syncDetails/addDailyData';
  static const String getLast7DaysData = '/syncDetails/getSyncedData';
}
