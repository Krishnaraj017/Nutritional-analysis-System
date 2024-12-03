import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/data/data_sources/local_data_source/hydration_local_data_source.dart';

import '../../../data/models/hydration.dart';
import '../../../domain/entities/params/get_hydrations_params.dart';

part 'hydration_weekly_state.dart';

@injectable
class HydrationWeeklyCubit extends Cubit<HydrationWeeklyState> {
  final HydrationLocalDataSource _hydrationRemoteDataSource;

  HydrationWeeklyCubit(this._hydrationRemoteDataSource)
      : super(HydrationWeeklyInitial());

  late StreamSubscription _hydrationSubscription;

  @override
  Future<void> close() {
    _hydrationSubscription.cancel();
    return super.close();
  }

  void watchWeeklyHydrationsData() async {
    final today = DateUtils.dateOnly(clock.now());
    final startDate =
        today.subtract(const Duration(days: DateTime.daysPerWeek - 1));
    final endDate = today;
    final params = GetHydrationsParams(
      startDate: startDate,
      endDate: endDate,
    );

    _hydrationSubscription =
        _hydrationRemoteDataSource.watchHydrations(params).listen(
      (hydrations) {
        final weeklyHydrations = <DateTime, Hydration>{};
        final startDate = params.startDate;
        for (var i = 0; i < DateTime.daysPerWeek; i++) {
          final date = startDate.add(Duration(days: i));
          final hydration = hydrations.firstWhere(
            (element) => element.date == date,
            orElse: () => Hydration(
              date: date,
              target: 0,
              localUpdatedAt: clock.now(),
            ),
          );
          weeklyHydrations[date] = hydration;
        }
        emit(HydrationWeeklyLoaded(weeklyHydrations: weeklyHydrations));
      },
    )..onError((e) {});
  }
}
