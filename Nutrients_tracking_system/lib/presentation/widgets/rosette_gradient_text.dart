import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class RGradientText extends StatelessWidget {
  const RGradientText(
    this.data, {
    super.key,
    this.style,
    this.gradient = Gradients.hotLinear,
    this.shaderRect,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  });

  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final Gradient gradient;
  final Rect? shaderRect;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      // Regarding the blend mode: The source is the gradient to draw, and the
      // destination is the text. With srcIn the gradient is drawn with the
      // shape of the text.
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => gradient.createShader(shaderRect ?? rect),
      child: Text(
        data,
        style: style,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaleFactor == null
            ? null
            : TextScaler.linear(textScaleFactor!),
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
      ),
    );
  }
}
