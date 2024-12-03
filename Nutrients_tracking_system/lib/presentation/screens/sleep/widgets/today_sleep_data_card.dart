import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/data/models/sleep.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class TodaySleepDataCard extends StatelessWidget {
  final Sleep? sleep;

  const TodaySleepDataCard({super.key, this.sleep});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Today',
          style: Theme.of(context).textTheme.title,
        ),
        const Gap(4),
        DecoratedBox(
          decoration: Theme.of(context).rosetteCardDecoration,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: _DataWidget(
                    iconPath: Assets.icons.bedtime.path,
                    value: sleep?.sleepLog?.sleepStartTimeString ?? '--',
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: _DataWidget(
                    iconPath: Assets.icons.wakeUpTime.path,
                    value: sleep?.sleepLog?.sleepEndTimeString ?? '--',
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: _DataWidget(
                    iconPath: Assets.icons.sleep.path,
                    value: sleep?.sleepLog?.sleepDurationInString ?? '--',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DataWidget extends StatelessWidget {
  final String iconPath;

  final String value;

  const _DataWidget({
    required this.iconPath,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          width: 40,
          height: 40,
        ),
        const Gap(4),
        Text(
          value,
          style: Theme.of(context).textTheme.regularSmall.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
