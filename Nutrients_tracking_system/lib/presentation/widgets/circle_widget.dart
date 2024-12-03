import 'package:flutter/cupertino.dart';

class ShadowCircle extends StatelessWidget {
  final double radius;

  const ShadowCircle({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        //#00F1FF4D, #399197

        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(0, 128, 128, 1),
            Color.fromRGBO(30, 255, 215, 1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}
