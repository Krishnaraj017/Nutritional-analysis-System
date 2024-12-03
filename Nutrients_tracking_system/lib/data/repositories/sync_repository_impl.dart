import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/data/data_sources/local_data_source/hydration_local_data_source.dart';
import 'package:statedemo/domain/entities/params/sync_params.dart';
import 'package:statedemo/domain/repositories/sync_repository.dart';

import '../data_sources/local_data_source/sleep_local_data_source.dart';
import '../data_sources/remote_data_source/sync_remote_data_source.dart';
import '../models/hydration.dart';
import '../models/sleep.dart';

@LazySingleton(as: SyncRepository)
class SyncRepositoryImpl implements SyncRepository {
  final SyncRemoteDataSource _remoteDataSource;

  final HydrationLocalDataSource _hydrationLocalDataSource;
  final SleepLocalDataSource _sleepLocalDataSource;

  SyncRepositoryImpl(
    this._remoteDataSource,
    this._hydrationLocalDataSource,
    this._sleepLocalDataSource,
  );

  @override
  Future<bool> syncAll() async {
    final data = await Future.wait([
      _hydrationLocalDataSource.getUnSyncedHydrationList(),
      _sleepLocalDataSource.getUnSyncedSleepList(),
    ]);

    if (data[0].isEmpty && data[1].isEmpty) {
      return false;
    }

    /// Backend is expecting the updationTime field to be updated locally.
    /// Not really sure this is the way to achieve but it is what it is. :(
    final updatedHydrationList = (data[0] as List<Hydration>)
        .map((e) => e.copyWith(cloudUpdatedAt: clock.now()))
        .toList();
    final updatedSleepList = (data[1] as List<Sleep>)
        .map((e) => e.copyWith(cloudUpdatedAt: clock.now()))
        .toList();
    final SyncParams syncParams = SyncParams(
      hydration: updatedHydrationList,
      sleep: updatedSleepList,
    );

    final syncParamsJson = syncParams.toJson();

    // backend hasn't updated the code and is required for now :(
    //for each item in syncParamsJson add day keyword with (mon,tue,wed,thu,fri,sat,sun)

    for (var i = 0; i < syncParamsJson['hydration'].length; i++) {
      syncParamsJson['hydration'][i]['day'] =
          _getDay(syncParamsJson['hydration'][i]['date']);
    }

    for (var i = 0; i < syncParamsJson['sleep'].length; i++) {
      syncParamsJson['sleep'][i]['day'] =
          _getDay(syncParamsJson['sleep'][i]['date']);
    }

    await _remoteDataSource.syncAll(syncParamsJson);

    await Future.wait([
      _hydrationLocalDataSource.addHydrations(hydrations: updatedHydrationList),
      _sleepLocalDataSource.addSleeps(sleeps: updatedSleepList),
    ]);
    return true;
  }

  @override
  Future<void> getLast7DaysData() async {
    final res = await _remoteDataSource.getLast7DaysData();
    await Future.wait([
      _hydrationLocalDataSource.addHydrations(hydrations: res.hydrations),
      _sleepLocalDataSource.addSleeps(sleeps: res.sleeps),
    ]);
    return;
  }

  String _getDay(String dateInIsoFormat) {
    final date = DateTime.parse(dateInIsoFormat);
    final day = date.weekday;
    switch (day) {
      case 1:
        return 'mon';
      case 2:
        return 'tue';
      case 3:
        return 'wed';
      case 4:
        return 'thu';
      case 5:
        return 'fri';
      case 6:
        return 'sat';
      case 7:
        return 'sun';
      default:
        return 'mon';
    }
  }
}
