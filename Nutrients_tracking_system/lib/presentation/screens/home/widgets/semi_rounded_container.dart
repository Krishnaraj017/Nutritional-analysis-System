import 'package:flutter/material.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';

class SemiRoundedContainer extends StatelessWidget {
  final Widget? child;

  const SemiRoundedContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCircleClipper(),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.gradientColors,
            ),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class BottomCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 50,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
