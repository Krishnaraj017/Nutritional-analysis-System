import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

import '../../../../data/models/sleep.dart';

class WeeklySleepDataCard extends StatelessWidget {
  final Map<DateTime, Sleep> sleeps;

  const WeeklySleepDataCard({super.key, required this.sleeps});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Last 7 Days',
          style: Theme.of(context).textTheme.title,
        ),
        const Gap(4),
        DecoratedBox(
          decoration: Theme.of(context).rosetteCardDecoration,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DataTable(
              columnSpacing: 20,
              dividerThickness: 0,
              horizontalMargin: 12,
              dataTextStyle: Theme.of(context)
                  .textTheme
                  .regularSmall
                  .copyWith(fontSize: 12),
              columns: [
                const DataColumn(
                  label: SizedBox.shrink(),
                ),
                DataColumn(label: Assets.icons.bedtime.svg()),
                DataColumn(label: Assets.icons.wakeUpTime.svg()),
                DataColumn(label: Assets.icons.sleep.svg()),
              ],
              rows: sleeps.entries.map(
                (e) {
                  final day = e.key;
                  final sleep = e.value;
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          DateFormat.E().format(day),
                          style: Theme.of(context)
                              .textTheme
                              .regularSmall
                              .copyWith(fontSize: 12, color: AppColors.gray1),
                        ),
                      ),
                      DataCell(
                        Text(sleep.sleepLog?.sleepStartTimeString ?? '--'),
                      ),
                      DataCell(
                        Text(sleep.sleepLog?.sleepEndTimeString ?? '--'),
                      ),
                      DataCell(
                        Text(sleep.sleepLog?.sleepDurationInString ?? '--'),
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
