import 'package:flutter/material.dart';

class GradientCircularDesign extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;

  const GradientCircularDesign({
    super.key,
    required this.radius,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: gradientColors,
          center: Alignment.center,
          radius: 1.0,
        ),
      ),
    );
  }
}
