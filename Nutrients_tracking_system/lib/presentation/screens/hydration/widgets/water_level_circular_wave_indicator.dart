import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaterLevelCircularWaveIndicator extends StatelessWidget {
  final int waterLevel;
  final int targetWaterLevel;

  const WaterLevelCircularWaveIndicator({
    super.key,
    required this.waterLevel,
    required this.targetWaterLevel,
  });

  static const _durations = [
    5000,
    4000,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor, width: 4),
        ),
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: waterLevel),
          duration: const Duration(milliseconds: 500),
          builder: (context, value, child) {
            final percentage = (value / targetWaterLevel * 100).toInt();
            final heightPercent = (100 - percentage) / 100;
            return Stack(
              children: [
                Center(
                  child: ClipOval(
                    child: WaveWidget(
                      config: CustomConfig(
                        durations: _durations,
                        heightPercentages: [
                          heightPercent,
                          heightPercent + 0.03,
                        ],
                        colors: [
                          AppColors.primaryColor,
                          AppColors.primaryColor.withOpacity(0.5),
                        ],
                      ),
                      waveAmplitude: 5,
                      size: const Size(230, 230),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$percentage%',
                        style: Theme.of(context).textTheme.h1Medium,
                      ),
                      const Gap(2),
                      Text(
                        '${value.toStringAsFixed(0)}ml / ${targetWaterLevel}ml',
                        style: Theme.of(context).textTheme.regularSemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CircularWaterDrops extends StatelessWidget {
  final double size;

  const _CircularWaterDrops({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: AppColors.gradientColors,
          ),
        ),
      ),
    );
  }
}
