import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/presentation/cubits/hydration_weekly_cubit/hydration_weekly_cubit.dart';
import 'package:statedemo/presentation/screens/hydration/widgets/hydration_weekly_progress.dart';
import 'package:statedemo/presentation/screens/hydration/widgets/water_glass_button.dart';
import 'package:statedemo/presentation/screens/hydration/widgets/water_level_circular_wave_indicator.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/presentation/widgets/rosette_primary_button.dart';
import 'package:statedemo/presentation/widgets/water_drop.dart';

import '../../../di/get_it.dart';
import '../../cubits/hydration_cubit/hydration_cubit.dart';

@RoutePage()
class HydrationDashboardScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const HydrationDashboardScreen({super.key});

  @override
  State<HydrationDashboardScreen> createState() =>
      _HydrationDashboardScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<HydrationWeeklyCubit>()..watchWeeklyHydrationsData(),
        ),
        BlocProvider(
          create: (_) => getIt<HydrationCubit>()..fetchTodaysHydration(),
        ),
      ],
      child: this,
    );
  }
}

class _HydrationDashboardScreenState extends State<HydrationDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const SliverAppBar(
          title: Row(
            children: [
              WaterDrop(
                size: 32,
              ),
              Gap(30),
              Text(
                'Hydration',
              ),
            ],
          ),
        ),
      ],
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Water Consumption Tracker',
                            style:
                                Theme.of(context).textTheme.regularSmallMedium,
                          ),
                        ),
                        const Gap(20),
                        Flexible(
                          child: RosettePrimaryButton(
                            height: 36,
                            onPressed: () {},
                            child: Text(
                              'Today',
                              style: Theme.of(context)
                                  .textTheme
                                  .regularSmall
                                  .apply(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    BlocBuilder<HydrationCubit, HydrationState>(
                      builder: (context, state) {
                        return WaterLevelCircularWaveIndicator(
                          waterLevel: state.hydration?.log.total ?? 0,
                          targetWaterLevel: state.hydration?.target ?? 1,
                        );
                      },
                    ),
                    const Gap(20),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.sizeOf(context).width > 350 ? 4 : 2,
                      ),
                      itemBuilder: (context, index) {
                        return WaterGlassButton(
                          waterIntake: 50 * (index + 1),
                          onTapped: (value) {
                            context
                                .read<HydrationCubit>()
                                .updateWaterIntake(value);
                          },
                        );
                      },
                    ),
                    const Gap(20),
                    BlocBuilder<HydrationWeeklyCubit, HydrationWeeklyState>(
                      builder: (context, state) {
                        if (state is HydrationWeeklyInitial) {
                          return const SizedBox();
                        }
                        return HydrationWeeklyProgressWidget(
                          weeklyHydrations: state.weeklyHydrations!,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
