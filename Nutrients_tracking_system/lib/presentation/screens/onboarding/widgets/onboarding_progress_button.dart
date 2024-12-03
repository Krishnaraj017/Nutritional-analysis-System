import 'package:flutter/material.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';

class OnboardingProgressButton extends StatelessWidget {
  final double value;
  final VoidCallback onPressed;
  const OnboardingProgressButton({
    super.key,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              strokeWidth: 2,
              value: value,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Ink(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  gradient: LinearGradient(colors: AppColors.gradientColors),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
