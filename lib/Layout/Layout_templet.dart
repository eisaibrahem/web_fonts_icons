import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../custom_widgets/custom_app_bar.dart';
import '../custom_widgets/nav_bar_category.dart';
import '../custom_widgets/table_ads_and_history.dart';
import '../shared/styles/themes.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({
    required this.child,
   });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
