import 'package:flutter/material.dart';

class GradientsScreen extends StatelessWidget {
  const GradientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'gradients Screen',
        style: TextStyle(
            fontSize: 42
        ),
      ),
    );
  }
}
