import 'package:flutter/material.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';

class RosetteTextButton extends StatelessWidget {
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const RosetteTextButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.gradient = const LinearGradient(
      colors: AppColors.gradientColors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: child,
      ),
    );
  }
}
