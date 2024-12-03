import 'dart:math';

import 'package:flutter/material.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

import '../../../widgets/rosette_progress_indicator.dart';

class HealthScoreIndicator extends StatefulWidget {
  const HealthScoreIndicator({super.key});

  @override
  State<HealthScoreIndicator> createState() => _HealthScoreIndicatorState();
}

class _HealthScoreIndicatorState extends State<HealthScoreIndicator> {
  static const int _totalSteps = 20;

  double _score = 20;

  double get currentStep => _score / 100 * _totalSteps;

  @override
  Widget build(BuildContext context) {
    return RosetteProgressIndicator(
      totalSteps: _totalSteps,
      currentStep: currentStep.toInt(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'My Health Score',
            style: Theme.of(context).textTheme.h3Bold.apply(
                  color: Colors.white,
                ),
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: _score),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) {
              return Text(
                '${value.toInt()} %',
                style: Theme.of(context).textTheme.h1Bold.apply(
                      color: Colors.white,
                    ),
              );
            },
          ),
          TextButton(
            onPressed: () {
              _score = Random().nextInt(100).toDouble();
              setState(() {});
            },
            child: Text(
              'Analyse',
              style: Theme.of(context)
                  .textTheme
                  .regular
                  .apply(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
