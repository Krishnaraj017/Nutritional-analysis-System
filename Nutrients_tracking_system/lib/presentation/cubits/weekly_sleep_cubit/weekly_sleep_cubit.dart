import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/domain/entities/params/get_sleeps_params.dart';

import '../../../data/data_sources/local_data_source/sleep_local_data_source.dart';
import '../../../data/models/sleep.dart';

part 'weekly_sleep_state.dart';

@injectable
class WeeklySleepCubit extends Cubit<WeeklySleepState> {
  final SleepLocalDataSource _sleepLocalDataSource;

  WeeklySleepCubit(this._sleepLocalDataSource) : super(WeeklySleepInitial());

  late StreamSubscription _sleepSubscription;

  @override
  Future<void> close() {
    _sleepSubscription.cancel();
    return super.close();
  }

  void watchWeeklySleepsData() async {
    final today = DateUtils.dateOnly(clock.now());
    final startDate =
        today.subtract(const Duration(days: DateTime.daysPerWeek - 1));
    final endDate = startDate.add(const Duration(days: DateTime.daysPerWeek));

    final params = GetSleepsParams(
      startDate: startDate,
      endDate: endDate,
    );

    _sleepSubscription = _sleepLocalDataSource.watchSleeps(params).listen(
      (sleeps) {
        final weeklySleeps = <DateTime, Sleep>{};

        final List<FlSpot> spots = [];

        for (var i = 0; i < DateTime.daysPerWeek; i++) {
          final date = startDate.add(Duration(days: i));
          final sleep = sleeps.firstWhere(
            (element) => element.date == date,
            orElse: () => Sleep(
              date: date,
              localUpdatedAt: clock.now(),
            ),
          );
          weeklySleeps[date] = sleep;
          if (sleep.hours != 0) spots.add(FlSpot(i.toDouble(), sleep.hours));
        }
        emit(WeeklySleepLoaded(sleeps: weeklySleeps, spots: spots));
      },
    )..onError((e) {});
  }
}
