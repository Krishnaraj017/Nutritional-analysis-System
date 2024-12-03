import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:statedemo/data/models/sleep.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class WeeklySleepStatisticsCard extends StatelessWidget {
  final Map<DateTime, Sleep> sleeps;
  final List<FlSpot> spots;

  const WeeklySleepStatisticsCard({
    super.key,
    required this.sleeps,
    required this.spots,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Last 7 Days Statistics',
          style: Theme.of(context).textTheme.title,
        ),
        const Gap(4),
        DecoratedBox(
          decoration: Theme.of(context).rosetteCardDecoration,
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 6,
                  minY: spots.isNotEmpty
                      ? spots.map((e) => e.y).reduce(
                                (value, element) =>
                                    value < element ? value : element,
                              ) -
                          1
                      : 0,
                  maxY: spots.isNotEmpty
                      ? spots.map((e) => e.y).reduce(
                                (value, element) =>
                                    value > element ? value : element,
                              ) +
                          1
                      : 0,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final day = sleeps.keys.elementAt(value.toInt());
                          final dayName = DateFormat.E().format(day);
                          return SideTitleWidget(
                            axisSide: AxisSide.bottom,
                            fitInside: SideTitleFitInsideData.fromTitleMeta(
                              meta,
                              distanceFromEdge: 0,
                            ),
                            space: 4,
                            child: Text(
                              dayName,
                              style: Theme.of(context)
                                  .textTheme
                                  .regularSmall
                                  .copyWith(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: AxisSide.right,
                            fitInside: SideTitleFitInsideData.fromTitleMeta(
                              meta,
                              distanceFromEdge: 0,
                            ),
                            child: Text(
                              '${value.toInt()}h',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .regularSmall
                                  .copyWith(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.white,
                      tooltipBorder:
                          const BorderSide(color: AppColors.primaryColor),
                      tooltipPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      tooltipRoundedRadius: 16,
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((e) {
                          final day = sleeps.keys.elementAt(e.spotIndex);
                          final sleep = sleeps[day];
                          return LineTooltipItem(
                            '${DateFormat.E().format(day)}\n${sleep?.sleepLog?.sleepDurationInString ?? '--'}',
                            Theme.of(context).textTheme.regularSmall.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 12,
                                ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      curveSmoothness: 0.4,
                      isCurved: true,
                      dotData: const FlDotData(
                        show: true,
                      ),
                      gradient: const LinearGradient(
                        colors: AppColors.gradientColors,
                      ),
                      spots: spots,
                    ),
                  ],
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: AppColors.gray2.withOpacity(0.5),
                      strokeWidth: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
