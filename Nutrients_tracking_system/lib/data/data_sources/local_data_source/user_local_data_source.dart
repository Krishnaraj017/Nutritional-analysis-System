import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/data/constants/hive_constants.dart';
import 'package:statedemo/domain/entities/local_app_info.dart';

import '../../models/user.dart';

abstract class UserLocalDataSource {
  Future<LocalAppInfo?> getLocalAppInfo();

  Future<void> updateLocalAppInfo({
    required LocalAppInfo localAppInfo,
  });

  Future<User?> getUser();

  Future<void> cacheUser({
    required User user,
  });

  Future<void> clearUser();
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl extends UserLocalDataSource {
  @override
  Future<LocalAppInfo?> getLocalAppInfo() async {
    final localAppBoxInfo =
        await Hive.openBox<LocalAppInfo>(HiveConstants.localAppInfoBox);
    return localAppBoxInfo.get(HiveConstants.localAppInfoKey);
  }

  @override
  Future<void> updateLocalAppInfo({required localAppInfo}) async {
    final localInfoBox =
        await Hive.openBox<LocalAppInfo>(HiveConstants.localAppInfoBox);
    await localInfoBox.put(HiveConstants.localAppInfoKey, localAppInfo);
  }

  @override
  Future<User?> getUser() async {
    final userBox = await Hive.openBox<User>(HiveConstants.userBox);
    return userBox.get(HiveConstants.userKey);
  }

  @override
  Future<void> cacheUser({required User user}) async {
    final userBox = await Hive.openBox<User>(HiveConstants.userBox);
    await userBox.put(HiveConstants.userKey, user);
  }

  @override
  Future<void> clearUser() async {
    final userBox = await Hive.openBox<User>(HiveConstants.userBox);
    await userBox.clear();
    return;
  }
}
