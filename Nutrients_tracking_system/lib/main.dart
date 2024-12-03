import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:statedemo/di/get_it.dart';
import 'package:statedemo/domain/entities/utils/hive_initializer.dart';

import 'app.dart';

DateTime get yesterday => clock.now().subtract(const Duration(days: 1));
//late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await HiveInitializer.initialize();
//  _cameras = await availableCameras();

  runApp(const MyApp());
}
