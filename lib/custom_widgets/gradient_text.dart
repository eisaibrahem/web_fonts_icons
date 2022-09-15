import 'package:flutter/material.dart';

class GradientFont extends StatelessWidget {
  GradientFont({
    required this.child,
    required this.gradient,
  });

  final Gradient gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child:child,
      shaderCallback: (Rect bounds) {
        const Rect rect = Rect.fromLTRB(0, 0, 150, 150);
        return gradient.createShader(rect);
      },
    );
  }
}