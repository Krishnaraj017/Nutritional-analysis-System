import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/utils/app_utils.dart';

import '../../../data/data_sources/local_data_source/hydration_local_data_source.dart';
import '../../../data/models/hydration.dart';
import '../../../domain/entities/enums.dart';

part 'hydration_state.dart';

@injectable
class HydrationCubit extends Cubit<HydrationState> {
  final HydrationLocalDataSource _hydrationLocalDataSource;

  HydrationCubit(this._hydrationLocalDataSource) : super(HydrationInitial()) {
    _hydrationSubscription =
        _hydrationLocalDataSource.watchHydration().listen((_) {
      fetchTodaysHydration();
    });
  }

  @override
  Future<void> close() {
    _hydrationSubscription.cancel();
    return super.close();
  }

  late final StreamSubscription _hydrationSubscription;

  void fetchTodaysHydration() async {
    emit(HydrationLoading());

    final hydration = await _hydrationLocalDataSource.getTodaysHydration();
    if (hydration != null) {
      emit(HydrationLoaded(hydration));
    } else {
      final date = DateUtils.dateOnly(clock.now());
      final hydration =
          Hydration(date: date, target: 2000, localUpdatedAt: clock.now());
      emit(HydrationLoaded(hydration));
    }
  }

  void updateWaterIntake(int waterIntake) async {
    final hydration = (state as HydrationLoaded).hydration!;
    final timeOfDay = AppUtils.getTimeOfDay();

    final updatedHydration = hydration.copyWith(
      log: hydration.log.copyWith(
        mor: timeOfDay == TimeOfDayEnum.morning
            ? hydration.log.mor + waterIntake
            : hydration.log.mor,
        aft: timeOfDay == TimeOfDayEnum.afternoon
            ? hydration.log.aft + waterIntake
            : hydration.log.aft,
        eve: timeOfDay == TimeOfDayEnum.evening
            ? hydration.log.eve + waterIntake
            : hydration.log.eve,
        nig: timeOfDay == TimeOfDayEnum.night
            ? hydration.log.nig + waterIntake
            : hydration.log.nig,
      ),
      localUpdatedAt: clock.now(),
    );
    await _hydrationLocalDataSource.updateHydration(updatedHydration);
  }
}
