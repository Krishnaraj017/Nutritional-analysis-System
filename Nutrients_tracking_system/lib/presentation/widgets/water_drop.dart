import 'package:flutter/material.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';

class WaterDrop extends StatelessWidget {
  final double size;

  const WaterDrop({super.key, this.size = 100.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // added padding so as to help in centering the water drop in Row
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipPath(
        clipper: WaterDropletClipper(),
        child: SizedBox(
          height: size,
          width: size,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WaterDropletClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, size.height);
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width * 0.75,
      size.height * 0.75,
    ); // Right-bottom curve
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.5,
      size.width / 2,
      size.height * 0.25,
    ); // Right-top curve
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.5,
      size.width * 0.25,
      size.height * 0.75,
    ); // Left-top curve
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width / 2,
      size.height,
    ); // Left-bottom curve
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}
