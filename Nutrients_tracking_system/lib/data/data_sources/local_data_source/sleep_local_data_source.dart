import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../domain/entities/params/get_sleeps_params.dart';
import '../../models/sleep.dart';

abstract class SleepLocalDataSource {
  Future<Sleep?> getTodaysSleep();

  Stream<List<Sleep>> watchSleeps(GetSleepsParams params);

  Future<List<Sleep>> getUnSyncedSleepList();

  Future<void> updateSleep(Sleep sleep);

  Stream<void> watchSleep();

  Future<void> addSleeps({required List<Sleep> sleeps});
}

@LazySingleton(as: SleepLocalDataSource)
class SleepLocalDataSourceImpl implements SleepLocalDataSource {
  final Isar _isar = Isar.getInstance()!;

  @override
  Future<Sleep?> getTodaysSleep() async {
    final today = DateUtils.dateOnly(clock.now());
    return _isar.sleeps.where().dateEqualTo(today).findFirst();
  }

  @override
  Future<List<Sleep>> getUnSyncedSleepList() async {
    return _isar.sleeps.where().filter().cloudUpdatedAtIsNull().findAll();
  }

  @override
  Future<void> updateSleep(Sleep sleep) async {
    //we are not updating cloudUpdatedAt because we are not syncing data to cloud
    final updatedSleep = sleep.copyWith(
      cloudUpdatedAt: null,
      localUpdatedAt: clock.now(),
    );
    await _isar.writeTxn(
      () => _isar.sleeps.put(updatedSleep),
    );
  }

  @override
  Stream<void> watchSleep() {
    return _isar.sleeps.watchLazy();
  }

  @override
  Stream<List<Sleep>> watchSleeps(GetSleepsParams params) {
    return _isar.sleeps
        .where()
        .filter()
        .dateGreaterThan(params.startDate, include: true)
        .dateLessThan(params.endDate, include: true)
        .watch(fireImmediately: true);
  }

  @override
  Future<void> addSleeps({required List<Sleep> sleeps}) async {
    await _isar.writeTxn(() async {
      await _isar.sleeps.putAll(sleeps);
    });
  }
}
