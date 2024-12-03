import 'package:hive_flutter/hive_flutter.dart';
import 'package:statedemo/data/models/user.dart';
import 'package:statedemo/domain/entities/local_app_info.dart';
import 'package:statedemo/domain/entities/time_of_day_adapter.dart';

import '../enums.dart';

class HiveInitializer {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LocalAppInfoAdapter());
    Hive.registerAdapter(GenderAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(TimeOfDayAdapter());
  }
}
