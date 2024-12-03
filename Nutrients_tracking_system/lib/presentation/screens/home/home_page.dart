import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/l;ast_7_days_cubit/last7_days_cubit.dart';
import 'package:statedemo/presentation/cubits/reminder_cubit/reminders_cubit.dart';
import 'package:statedemo/presentation/cubits/sleep_cubit/sleep_cubit.dart';
import 'package:statedemo/presentation/cubits/tips_cubit/tips_cubit.dart';
import 'package:statedemo/presentation/cubits/weekly_sleep_cubit/weekly_sleep_cubit.dart';
import 'package:statedemo/presentation/screens/home/widgets/food_widget.dart';
import 'package:statedemo/presentation/screens/home/widgets/health_score_indicator.dart';
import 'package:statedemo/presentation/screens/home/widgets/reminders_widget.dart';
import 'package:statedemo/presentation/screens/home/widgets/semi_rounded_container.dart';
import 'package:statedemo/presentation/screens/home/widgets/sleep_widget.dart';
import 'package:statedemo/presentation/screens/home/widgets/tips_widget.dart';
import 'package:statedemo/presentation/screens/home/widgets/water_level_widget.dart';
import 'package:statedemo/presentation/screens/home/widgets/work_widget.dart';

import '../../../di/get_it.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/hydration_cubit/hydration_cubit.dart';
import 'widgets/weather_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SemiRoundedContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const WeatherWidget(),
                      IconButton(
                        onPressed: () {},
                        icon: Assets.icons.notification.svg(
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const HealthScoreIndicator(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                BlocConsumer<Last7DaysCubit, Last7DaysState>(
                  listener: (context, state) {
                    if (state is Last7DaysLoaded) {
                      final user = context.read<AuthCubit>().state.user;
                      context
                          .read<AuthCubit>()
                          .updateUser(user!.copyWith(last7daysSynced: true));
                    }
                  },
                  builder: (context, state) {
                    if (state is Last7DaysLoading) {
                      return const Column(
                        children: [
                          Text('Syncing data...'),
                          Gap(10),
                          LinearProgressIndicator(),
                          Gap(20),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                // BlocProvider(
                //   create: (_) => getIt<TipsCubit>()..getTips(),
                //   child: const TipsWidget(),
                // ),
                const Gap(20),
                SizedBox(
                  height: 160,
                  child: Row(
                    children: const [
                      // Expanded(
                      //   child: BlocProvider(
                      //     create: (context) =>
                      //         getIt<HydrationCubit>()..fetchTodaysHydration(),
                      //     child: const WaterLevelWidget(),
                      //   ),
                      // ),
                      //const Gap(20),
                      Expanded(child: FoodWidget()),
                    ],
                  ),
                ),
                const Gap(20),
                // SizedBox(
                //   height: 160,
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: MultiBlocProvider(
                //           providers: [
                //             BlocProvider(
                //               create: (context) => getIt<SleepCubit>(),
                //             ),
                //             BlocProvider(
                //               create: (context) => getIt<WeeklySleepCubit>()
                //                 ..watchWeeklySleepsData(),
                //             ),
                //           ],
                //           child: const SleepWidget(),
                //         ),
                //       ),
                //       const Gap(20),
                //       const Expanded(child: WorkWidget()),
                //     ],
                //   ),
                // ),
                const Gap(20),
                // BlocProvider(
                //   create: (_) => getIt<RemindersCubit>()
                //     ..filerReminder()
                //     ..getReminders(),
                //   child: const RemindersWidget(),
                // ),
                const Gap(80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
