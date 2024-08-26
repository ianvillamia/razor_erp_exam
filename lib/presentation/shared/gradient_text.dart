import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    this.textStyle,
  });
  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.white,
          Colors.white.withOpacity(0.8), // Slightly less transparent white
          Colors.white.withOpacity(0.4), // Even more transparent
          Colors.white.withOpacity(0.3), // Near transparent
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: textStyle),
    );
  }
}
