import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class WaterGlassButton extends StatefulWidget {
  final int waterIntake;
  final Function(int value) onTapped;

  const WaterGlassButton({
    super.key,
    required this.waterIntake,
    required this.onTapped,
  });

  @override
  State<WaterGlassButton> createState() => _WaterGlassButtonState();
}

class _WaterGlassButtonState extends State<WaterGlassButton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
        widget.onTapped(widget.waterIntake);
      },
      onTapDown: (_) {
        setState(() {
          _scale = 0.95;
        });
      },
      onTapUp: (_) {
        setState(() {
          _scale = 1.0;
        });
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x19040404),
                blurRadius: 20,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.svgs.waterGlass.svg(height: 28, width: 28),
                const Gap(2),
                Text(
                  '${widget.waterIntake} ml',
                  style: Theme.of(context)
                      .textTheme
                      .regularSmall
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
