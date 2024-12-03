import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statedemo/presentation/cubits/hydration_cubit/hydration_cubit.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/presentation/widgets/water_drop.dart';

import '../../../widgets/liquid_progress_indicator/liquid_progress_indicator.dart';

class WaterLevelWidget extends StatelessWidget {
  const WaterLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HydrationCubit, HydrationState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: Theme.of(context).rosetteCardDecoration,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Water',
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.regularSmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    const WaterDrop(
                      size: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LiquidLinearProgressIndicator(
                  direction: Axis.vertical,
                  value: state.hydration?.ratio ?? 0,
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.gradientColors,
                  ),
                  borderRadius: 20,
                  center: Text(
                    state.hydration?.ratioString ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.regularSmall.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
