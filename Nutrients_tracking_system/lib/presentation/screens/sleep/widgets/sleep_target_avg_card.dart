import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class SleepTargetAvgCard extends StatelessWidget {
  final double targetSleep;
  final double avgSleep;

  const SleepTargetAvgCard({
    super.key,
    required this.targetSleep,
    required this.avgSleep,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: Theme.of(context).rosetteCardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _DataWidget(
              iconPath: Assets.icons.targetArrow.path,
              title: 'Sleep Target',
              value: sleepHoursString(targetSleep),
            ),
            const Gap(16),
            _DataWidget(
              iconPath: Assets.icons.chartAverage.path,
              title: 'Avg Sleep',
              value: sleepHoursString(avgSleep),
            ),
          ],
        ),
      ),
    );
  }

  String sleepHoursString(hours) {
    final h = hours.floor();
    final m = ((hours - h) * 60).floor();
    return m == 0 ? '$h h' : '$h h $m m';
  }
}

class _DataWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;

  const _DataWidget({
    required this.iconPath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 28,
          height: 28,
        ),
        const Gap(8),
        Expanded(child: Text(title)),
        Text(value),
      ],
    );
  }
}
