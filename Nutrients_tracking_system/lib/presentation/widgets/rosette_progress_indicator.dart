import 'dart:math';

import 'package:flutter/material.dart';
import 'package:statedemo/presentation/widgets/circular_progress_indicator.dart';

class RosetteProgressIndicator extends StatefulWidget {
  final int totalSteps;
  final int currentStep;
  final Widget? child;

  const RosetteProgressIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.child,
  });

  @override
  State<RosetteProgressIndicator> createState() =>
      _RosetteProgressIndicatorState();
}

class _RosetteProgressIndicatorState extends State<RosetteProgressIndicator>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: widget.currentStep),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return CircularStepProgressIndicator(
          totalSteps: widget.totalSteps,
          currentStep: value,
          height: 300,
          width: 300,
          startingAngle: -pi * 1.17,
          arcSize: 5,
          stepSize: 12,
          roundedCap: (_, __) => true,
          unselectedColor: Colors.white,
          selectedColor: Colors.white,
          child: widget.child,
        );
      },
    );
  }
}
