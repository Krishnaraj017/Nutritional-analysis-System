import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/di/get_it.dart';
import 'package:statedemo/presentation/cubits/weekly_sleep_cubit/weekly_sleep_cubit.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/screens/sleep/widgets/sleep_target_avg_card.dart';
import 'package:statedemo/presentation/screens/sleep/widgets/today_sleep_data_card.dart';
import 'package:statedemo/presentation/screens/sleep/widgets/weekly_sleep_data_card.dart';
import 'package:statedemo/presentation/screens/sleep/widgets/weekly_sleep_statistics_card.dart';
import 'package:statedemo/presentation/widgets/rosette_primary_button.dart';

import '../../widgets/custom_loader.dart';

@RoutePage()
class SleepTrackerScreen extends StatelessWidget implements AutoRouteWrapper {
  const SleepTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Tracker'),
      ),
      body: BlocBuilder<WeeklySleepCubit, WeeklySleepState>(
        builder: (context, state) {
          if (state is WeeklySleepLoading) {
            return const CustomLoader();
          }
          if (state is WeeklySleepLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    SleepTargetAvgCard(
                      avgSleep: state.averageSleepHours,
                      targetSleep: 8,
                    ),
                    const Gap(16),
                    TodaySleepDataCard(
                      sleep: state.sleeps[DateUtils.dateOnly(clock.now())],
                    ),
                    const Gap(16),
                    WeeklySleepStatisticsCard(
                      sleeps: state.sleeps,
                      spots: state.spots,
                    ),
                    const Gap(16),
                    WeeklySleepDataCard(
                      sleeps: state.sleeps,
                    ),
                    const Gap(64),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: RosettePrimaryButton(
        onPressed: () {
          context.router.push(
            AddSleepTimeRoute(
              sleep: context.read<WeeklySleepCubit>().state.todaySleep,
            ),
          );
        },
        width: 52,
        height: 52,
        elevation: 4,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WeeklySleepCubit>()..watchWeeklySleepsData(),
      child: this,
    );
  }
}
