import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GradientIcon extends StatelessWidget {
  GradientIcon({
    required this.icon,
    required this.size,
    required this.gradient,
  });

  final String icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SvgPicture.string(
        icon,
        height: 150,
        width: 150,
        color: Colors.white,
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}