import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:portfolio/screens/color_information/color_information.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/screens/gradients_screen/gradients_screen.dart';
import 'package:portfolio/screens/home_screen/cubit/home_cubit.dart';
import 'package:portfolio/screens/home_screen/cubit/home_state.dart';
import 'package:portfolio/screens/icons_screen/icons_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/nav_bar_category.dart';
import '../../custom_widgets/custom_app_bar.dart';
import '../palettes_screen/palettes_screen.dart';

class HomeScreen extends StatelessWidget {
 static PageController pageController = PageController();
  SidebarXController sidebarXController =
      SidebarXController(selectedIndex: 0, extended: true);
 static final tooltipController = JustTheController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: PreferredSize(
              preferredSize: Size(screenSize.width,65),
              child: CustomAppBar(),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NavBarCategory(index: 25),

                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      FontsScreen(),
                      IconsScreen(),
                      PalettesScreen(),
                      GradientsScreen(),
                      ColorInformation(),
                    ],
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index) {

                    },
                  ),
                ),

                const TableAdsAndHistory(),
              ],
            ),
          ),
        );
      },
    );
  }


}

