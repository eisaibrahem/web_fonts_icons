import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import '../screens/color_information/color_information.dart';
import '../screens/colors_extractor_screen/color_extractor_screen.dart';
import '../screens/copy_right_screen/copy_right_screen.dart';
import '../screens/fonts_screen/fonts_screen.dart';
import '../screens/gradients_screen/gradients_screen.dart';
import '../screens/icons_screen/icons_screen.dart';
import '../screens/palettes_finder_screen/palettes_finder_screen.dart';
import '../screens/palettes_screen/palettes_screen.dart';
import '../shared/components.dart';
import '../shared/routing/locator.dart';
import '../shared/routing/nav_services.dart';
import '../shared/routing/rout_name.dart';
import '../shared/styles/themes.dart';

class NavBarCategory extends StatefulWidget {
  const NavBarCategory({super.key});

  @override
  State<NavBarCategory> createState() => _NavBarCategoryState();
}

class _NavBarCategoryState extends State<NavBarCategory> {
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
        color: Colors.white,
        width: 75.12,
        height: size.height,
        child: Column(
          children: [
            buildItemOfCategory(
                icon: SvgPicture.asset(
                  'assets/icons/fonts-logo.svg',
                  height: 22,
                ),
                index:  0,
                textTip:  'FONTS',
                onTap: (){
                setState(() {
                selectCategory(0);

                  navigateTo(context, FontsScreen());
                //locator<NavigationService>().navigateTo(FontsRoute);
              });

                }

            ),
            buildItemOfCategory(
                icon:  SvgPicture.asset(
                  "assets/icons/icons-logo.svg",
                  height: 26,
                ),
                index:   1,
                textTip:   'ICONS',
                onTap: (){
                  setState(() {
                    selectCategory(1);

                      navigateTo(context, IconsScreen());
                   // locator<NavigationService>().navigateTo(IconsRoute);
                  });

                }
            ),
            buildItemOfCategory(
                icon: SvgPicture.asset(
                  "assets/icons/color-palette-logo.svg",
                  height: 23,
                ),
                index:  2,
                textTip:  'COLOR BALETTES',
                onTap: (){
                  setState(() {
                    selectCategory(2);

                     navigateTo(context, PalettesScreen());
                    // locator<NavigationService>().navigateTo(PalettesRoute);
                  });

                }
            ),
            buildItemOfCategory(
                icon:   SvgPicture.asset(
                  "assets/icons/gradient-logo.svg",
                  height: 23,
                ),
                index:   3,
                textTip:   'GRADIENTS',
                onTap: (){
                  setState(() {
                    selectCategory(3);

                     navigateTo(context, GradientsScreen());
                    //  locator<NavigationService>().navigateTo(GradientsRoute);
                  });

                }

            ),
            const Divider(
              endIndent: 10,
              height: 1,
              color: Colors.grey,
              indent: 10,
            ),
            buildItemOfCategory(
                icon:   SvgPicture.asset(
                  "assets/icons/color-information-logo.svg",
                  height: 26,
                ),
                index:  4,
                textTip:  'COLOR INFORMATION',
                onTap: (){
                  setState(() {
                    selectCategory(4);

                    navigateTo(context, ColorInformation());
                    //  locator<NavigationService>().navigateTo(ColorsInfoRoute);
                  });

                }
            ),
            buildItemOfCategory(
                icon:   SvgPicture.asset(
                  "assets/icons/color-extractor-logo.svg",
                  height: 26,
                ),
                index:  5,
                textTip: 'COLORS EXTRACTOR',
                onTap: (){
                  setState(() {
                    selectCategory(5);

                    navigateTo(context, ColorsExtractorScreen());
                    //  locator<NavigationService>().navigateTo(ColorsExtractorRoute);
                  });

                }
            ),
            buildItemOfCategory(
                icon:  SvgPicture.asset(
                  "assets/icons/palette-finder-logo.svg",
                  height: 30,
                  alignment: Alignment.centerLeft,

                ),
                index:  6,
                textTip:    'PALETTES FINDER',
                onTap: (){
                  setState(() {
                    selectCategory(6);

                    navigateTo(context, PalettesFinderScreen());
                    //   locator<NavigationService>().navigateTo(PaletteFinderRoute);
                  });

                }
            ),
            buildItemOfCategory(
                icon:  SvgPicture.asset(
                  "assets/icons/copy-right-logo.svg",
                  height: 27,
                ),
                index:  7,
                textTip:   'COPYRIGHT INFRINGEMENTS',
                onTap: (){
                  setState(() {
                    selectCategory(7);
                   navigateTo(context, CopyRightScreen());
                    //   locator<NavigationService>().navigateTo(ContactUsRoute);
                  });

                }
            ),
          ],
        )
    );

  }

  Widget buildItemOfCategory(
      {
        Widget? icon,
        required int index,
        String? textTip,
        Function()? onTap,
      }) {
    return JustTheTooltip(
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
        child:  Text(textTip??'',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
      elevation: 1,
      barrierDismissible: true,
      tailBaseWidth: 12,
      tailLength: 8,
      backgroundColor: Colors.black,
      waitDuration: const Duration(milliseconds: 300),
      preferredDirection:AxisDirection.right ,
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 42.29,
          color: selected[index]
              ? kPrimaryColor
              : Colors.white,
          margin: const EdgeInsets.only(top: 5.3, bottom: 5.3),
          child: Row(
            children: [
              selected[index]
                  ? Container(
                height: 50,
                width: 5,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              )
                  : Container(),
              index==6?SizedBox(width: selected[index] ? 18:23,):  SizedBox(
                width: selected[index] ? 20: 25,
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: icon,
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<bool> selected = [true, false, false, false, false, false, false, false,];
void selectCategory(int n) {
  for (int i = 0; i < 8; i++) {
    if (i == n) {
        selected[i] = true;
    } else {
        selected[i] = false;
    }
  }
}