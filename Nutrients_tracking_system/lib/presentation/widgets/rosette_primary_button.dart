import 'package:flutter/material.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';

class RosettePrimaryButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final BoxShape shape;
  final double elevation;

  const RosettePrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width = double.infinity,
    this.height = 52.0,
    this.shape = BoxShape.rectangle,
    this.elevation = 0,
    this.gradient = const LinearGradient(
      colors: AppColors.gradientColors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = shape == BoxShape.rectangle
        ? this.borderRadius ?? BorderRadius.circular(99)
        : null;
    return Material(
      elevation: elevation,
      color: Colors.transparent,
      shape: shape == BoxShape.rectangle
          ? RoundedRectangleBorder(borderRadius: borderRadius!)
          : null,
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient,
            shape: shape,
            borderRadius: borderRadius,
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: borderRadius != null
                  ? RoundedRectangleBorder(borderRadius: borderRadius)
                  : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
