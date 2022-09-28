import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../custom_widgets/custom_app_bar.dart';
import '../custom_widgets/nav_bar_category.dart';
import '../custom_widgets/table_ads_and_history.dart';
import '../shared/styles/themes.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget? child;
  const LayoutTemplate({
     this.child,
   });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
          (size.width>1800&&size.width<2000)?
          size.width*0.05:
          (size.width>2000&&size.width<2200)?
          size.width*0.08:
          (size.width>2200&&size.width<2400)?
          size.width*0.1:
          (size.width>2400&&size.width<2600)?
          size.width*0.12:
          (size.width>2600&&size.width<2800)?
          size.width*0.14:
          (size.width>2800&&size.width<3000)?
          size.width*0.18:
          (size.width>3000&&size.width<3200)?
          size.width*0.22:
          (size.width>3200)?
          size.width*0.26:
          0,
      ),
      child: child??Container(),
    );
  }
}
