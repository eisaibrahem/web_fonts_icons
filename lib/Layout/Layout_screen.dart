import 'package:flutter/material.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../screens/home_screen/tablet_home_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => Container(color:Colors.blue),
      tablet: (BuildContext context) => HomeScreen(),
      desktop: (BuildContext context) => HomeScreen(),
    );
  }
}
