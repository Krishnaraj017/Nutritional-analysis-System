import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../constants/hive_constants.dart';

abstract class TokenLocalDataSource {
  Future<void> cacheAccessToken(String token);

  Future<void> cacheRefreshToken(String token);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> deleteAccessToken();

  Future<void> deleteRefreshToken();

  Future<void> deleteAllTokens();
}

@LazySingleton(as: TokenLocalDataSource)
class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  @override
  Future<void> cacheAccessToken(String token) async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    await box.put(HiveConstants.accessTokenKey, token);
  }

  @override
  Future<void> cacheRefreshToken(String token) async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    await box.put(HiveConstants.refreshTokenKey, token);
  }

  @override
  Future<void> deleteAccessToken() async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    await box.delete(HiveConstants.accessTokenKey);
  }

  @override
  Future<void> deleteAllTokens() async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    await box.deleteAll(
      [HiveConstants.accessTokenKey, HiveConstants.refreshTokenKey],
    );
  }

  @override
  Future<void> deleteRefreshToken() async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    await box.delete(HiveConstants.refreshTokenKey);
  }

  @override
  Future<String?> getAccessToken() async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    return box.get(HiveConstants.accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    final box = await Hive.openBox(HiveConstants.tokenBoxName);
    return box.get(HiveConstants.refreshTokenKey);
  }
}
