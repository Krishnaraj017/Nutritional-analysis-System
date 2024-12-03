import 'package:flutter/material.dart';

import 'circle_widget.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  static const _circleRadius = 181.0;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: -_circleRadius / 2,
            right: -_circleRadius / 2,
            child: ShadowCircle(radius: _circleRadius),
          ),
          child,
        ],
      ),
    );
  }
}
