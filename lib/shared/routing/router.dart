import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/color_information/color_information.dart';
import 'package:portfolio/screens/colors_extractor_screen/color_extractor_screen.dart';
import 'package:portfolio/screens/copy_right_screen/copy_right_screen.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/screens/palettes_finder_screen/palettes_finder_screen.dart';
import 'package:portfolio/shared/routing/rout_name.dart';

import '../../screens/fonts_screen/font_details_screen.dart';
import '../../screens/gradients_screen/gradients_screen.dart';
import '../../screens/icons_screen/icons_details_screen.dart';
import '../../screens/icons_screen/icons_screen.dart';
import '../../screens/palettes_screen/palettes_screen.dart';
import '../../screens/saved_screen/saved_screen.dart';
import '../../shared/routing/string_extentions.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  //get the router data
  var routerData = settings.name!.getRoutingData;

  switch (routerData.route) {
    case FontsRoute:
      return _getPageRoute(FontsScreen(), settings);
      case FontsDetailsRoute:
      return _getPageRoute(FontDetailsScreen(), settings);
    case IconsRoute:
    //  var id = int.tryParse(routerData['id']);
      return _getPageRoute(IconsScreen(), settings);
      case IconsDetailsRoute:
    //  var id = int.tryParse(routerData['id']);
      return _getPageRoute(IconsDetailsScreen(), settings);
    case PalettesRoute:
      return _getPageRoute(PalettesScreen(), settings);
    case GradientsRoute:
      return _getPageRoute(GradientsScreen(), settings);
    case ColorsInfoRoute:
      return _getPageRoute(ColorInformation(), settings);
    case ColorsExtractorRoute:
      return _getPageRoute(ColorsExtractorScreen(), settings);
    case PaletteFinderRoute:
      return _getPageRoute(PalettesFinderScreen(), settings);
    case SavedRoute:
      return _getPageRoute(SavedScreen(), settings);
    case ContactUsRoute:
      return _getPageRoute(CopyRightScreen(), settings);
    default:
      return _getPageRoute(FontsScreen(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) => child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
