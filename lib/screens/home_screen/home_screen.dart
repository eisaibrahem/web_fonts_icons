import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:portfolio/screens/color_palettes_screen/color_palettes_scrren.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/screens/gradients_screen/gradients_screen.dart';
import 'package:portfolio/screens/home_screen/cubit/home_cubit.dart';
import 'package:portfolio/screens/home_screen/cubit/home_state.dart';
import 'package:portfolio/screens/icons_screen/icons_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../custom_widgets/table_of_category.dart';
import '../../custom_widgets/custom_app_bar.dart';

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
              preferredSize: Size(screenSize.width, screenSize.width*0.050),
              child: CustomAppBar(),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TableOfCategory(),

                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      FontsScreen(),
                      IconsScreen(),
                      ColorPalettesScrren(),
                      GradientsScreen(),
                    ],
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index) {

                    },
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3)),
                  margin: const EdgeInsets.only(right: 5, bottom: 5, top: 5),
                  padding: const EdgeInsets.all(5),
                  width: screenSize.width * 0.22,
                  height: screenSize.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        constraints: const BoxConstraints(
                          maxHeight: 270,
                          minHeight: 200,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.network(
                            'https://angartwork.akamaized.net/webp/?id=153545060&size=296',
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.width,
                        height: 45,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              buildCategoryItemHistory(context,
                                  'assets/icons/Group 660.svg', 0, cubit),
                              const SizedBox(width: 10,),
                              buildCategoryItemHistory(context,
                                  "assets/icons/Group 659.svg", 1, cubit),
                              const SizedBox(width: 10,),
                              buildCategoryItemHistory(context,
                                  "assets/icons/Group 664.svg", 2, cubit),
                              const SizedBox(width: 10,),
                              buildCategoryItemHistory(context,
                                  "assets/icons/Group 1310.svg", 3, cubit),
                              const SizedBox(width: 5,),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return buildItemHistory();
                            },
                            itemCount: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

 static Widget buildCategoryItemHistory(
      BuildContext context, String assetSVG, int index, HomeCubit cubit) {
    return InkWell(
      onTap: () {
        cubit.selectCategoryHistory(index);
      },
      child: AnimatedContainer(

        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: cubit.selectedHistory[index]
              ? Colors.white
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(3),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric( horizontal: 5),
        child: SvgPicture.asset(
          assetSVG,
          height: 20.5,
          width: 20.5,
          color: cubit.selectedHistory[index]
              ? HexColor('#525667')
              : HexColor('#A7AAB9'),
        ),
      ),
    );
  }

 static Widget buildItemHistory() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 3),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: const Text(
          'Cutie Maggie Demo',
          style: TextStyle(
            fontFamily: 'Matura MT Script Capitals',
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

