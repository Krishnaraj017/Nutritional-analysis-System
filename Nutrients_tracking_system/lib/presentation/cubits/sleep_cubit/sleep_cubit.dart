import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/local_data_source/sleep_local_data_source.dart';
import '../../../data/models/sleep.dart';

part 'sleep_state.dart';

@injectable
class SleepCubit extends Cubit<SleepState> {
  final SleepLocalDataSource _sleepLocalDataSource;

  SleepCubit(this._sleepLocalDataSource) : super(SleepInitial());

  void updateSleepDuration({
    required TimeOfDay sleepStartTime,
    required TimeOfDay sleepEndTime,
    String? remarks,
  }) async {
    final Sleep sleep = Sleep(
      date: DateUtils.dateOnly(clock.now()),
      localUpdatedAt: clock.now(),
      sleepLog: SleepLog(
        remarks: remarks,
        sleepStartTime: '${sleepStartTime.hour}:${sleepStartTime.minute}',
        sleepEndTime: '${sleepEndTime.hour}:${sleepEndTime.minute}',
      ),
    );
    await _sleepLocalDataSource.updateSleep(sleep);
  }

  void addTestForLast7Days() async {
    final today = DateUtils.dateOnly(clock.now());
    for (var i = 0; i < 7; i++) {
      final date = today.subtract(Duration(days: i));
      final randomDuration = Random().nextInt(8) + 1;
      final sleep = Sleep(
        date: date,
        localUpdatedAt: clock.now(),
        sleepLog: SleepLog(
          sleepStartTime: '10:00',
          sleepEndTime: '10:00',
          remarks: 'Test sleep duration $randomDuration hours',
        ),
      );

      await _sleepLocalDataSource.updateSleep(sleep);
    }
  }
}
