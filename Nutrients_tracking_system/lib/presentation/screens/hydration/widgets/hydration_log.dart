import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/data/models/hydration.dart';
import 'package:statedemo/domain/entities/enums.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/presentation/widgets/liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:statedemo/utils/extensions/date_time_extensions.dart';

class HydrationLogWidget extends StatelessWidget {
  final Hydration hydration;

  const HydrationLogWidget({
    super.key,
    required this.hydration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${hydration.date.relativeDateName}\'s Log',
          style: Theme.of(context).textTheme.regularSemiBold,
        ),
        const Gap(20),
        ...List.generate(
          TimeOfDayEnum.values.length,
          (index) {
            final value = TimeOfDayEnum.values[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: LiquidLinearProgressIndicator(
                  value: hydration.rationBasedOnTimeOfDay(value),
                  backgroundColor: Colors.transparent,
                  gradient: const LinearGradient(
                    colors: AppColors.gradientColors,
                  ),
                  borderRadius: 20,
                  center: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            value.toString(),
                          ),
                        ),
                        Text(
                          '${hydration.log.hydrationLevelBasedOnTimeOfDay(value)} ml',
                          style: Theme.of(context).textTheme.regularSmallMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ).animate().moveY(
                    begin: 20,
                    end: 0,
                    delay: Duration(milliseconds: 100 * index),
                  ),
            );
          },
        ),
      ],
    );
  }
}
