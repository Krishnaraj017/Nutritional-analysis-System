import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:statedemo/data/models/hydration.dart';
import 'package:statedemo/domain/entities/params/get_hydrations_params.dart';

abstract class HydrationLocalDataSource {
  Future<Hydration?> getTodaysHydration();

  Stream<List<Hydration>> watchHydrations(GetHydrationsParams params);

  Future<List<Hydration>> getUnSyncedHydrationList();

  Future<void> updateHydration(Hydration hydration);

  Stream<void> watchHydration();

  Future<void> addHydrations({required List<Hydration> hydrations});
}

@LazySingleton(as: HydrationLocalDataSource)
class HydrationLocalDataSourceImpl implements HydrationLocalDataSource {
  final Isar _isar = Isar.getInstance()!;

  @override
  Future<Hydration?> getTodaysHydration() {
    final today = DateUtils.dateOnly(clock.now());
    return _isar.hydrations.where().dateEqualTo(today).findFirst();
  }

  @override
  Stream<List<Hydration>> watchHydrations(GetHydrationsParams params) {
    return _isar.hydrations
        .where()
        .filter()
        .dateGreaterThan(params.startDate, include: true)
        .dateLessThan(params.endDate, include: true)
        .watch(fireImmediately: true);
  }

  @override
  Future<List<Hydration>> getUnSyncedHydrationList() {
    return _isar.hydrations.where().filter().cloudUpdatedAtIsNull().findAll();
  }

  @override
  Future<void> updateHydration(Hydration hydration) async {
    //we are not updating cloudUpdatedAt because we are not syncing data to cloud
    final updatedHydration = hydration.copyWith(
      cloudUpdatedAt: null,
      localUpdatedAt: clock.now(),
    );
    await _isar.writeTxn(
      () => _isar.hydrations.put(updatedHydration),
    );
  }

  @override
  Stream<void> watchHydration() {
    return _isar.hydrations.watchLazy();
  }

  @override
  Future<void> addHydrations({required List<Hydration> hydrations}) async {
    await _isar.writeTxn(() async {
      await _isar.hydrations.putAll(hydrations);
    });
  }
}
