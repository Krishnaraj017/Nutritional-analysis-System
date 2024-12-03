import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statedemo/presentation/cubits/tips_cubit/tips_cubit.dart';
import 'package:statedemo/presentation/cubits/tips_cubit/tips_state.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/presentation/widgets/rosette_gradient_text.dart';

class TipsWidget extends StatefulWidget {
  const TipsWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TipsWidgetState();
}

class _TipsWidgetState extends State<TipsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Tip of the Day",
          style: Theme.of(context).textTheme.regularMedium,
          textAlign: TextAlign.center,
        ),
        Center(
          child: BlocBuilder<TipsCubit, TipsState>(
            builder: (context, state) {
              if (state is TipLoaded) {
                return RGradientText(
                  state.remoteTip,
                  gradient: const LinearGradient(
                    colors: AppColors.gradientColors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  style: Theme.of(context).textTheme.titleBold,
                  textAlign: TextAlign.center,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
