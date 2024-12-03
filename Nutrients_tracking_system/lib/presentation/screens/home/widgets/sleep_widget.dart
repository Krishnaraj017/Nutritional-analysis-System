import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statedemo/presentation/cubits/weekly_sleep_cubit/weekly_sleep_cubit.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class SleepWidget extends StatelessWidget {
  const SleepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeeklySleepCubit, WeeklySleepState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.router.push(const SleepTrackerRoute());
          },
          child: DecoratedBox(
            decoration: Theme.of(context).rosetteCardDecoration,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sleep',
                        style:
                            Theme.of(context).textTheme.regularSmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: LineChart(
                          LineChartData(
                            titlesData: const FlTitlesData(
                              show: false,
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            lineTouchData: const LineTouchData(
                              enabled: false,
                            ),
                            gridData: const FlGridData(
                              show: false,
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                curveSmoothness: 0.5,
                                preventCurveOverShooting: true,
                                isCurved: true,
                                gradient: const LinearGradient(
                                  colors: AppColors.gradientColors,
                                ),
                                dotData: const FlDotData(
                                  show: false,
                                ),
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: const LinearGradient(
                                    colors: AppColors.gradientColors,
                                  ),
                                ),
                                spots: state.spots,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Avg ${state.averageSleepHours.toStringAsFixed(1)}h",
                          style: Theme.of(context).textTheme.regularSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
