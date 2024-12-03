import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Gradient gradient;
  const GradientButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.width = 60,
    this.height = 44,
    this.gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF1EFFD7),
        Color(0xFF008080),
      ],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: const BorderRadius.all(Radius.circular(60)),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
