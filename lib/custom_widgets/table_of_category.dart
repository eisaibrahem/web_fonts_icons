import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:portfolio/screens/color_information/color_information.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/screens/gradients_screen/gradients_screen.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';
import 'package:portfolio/screens/icons_screen/icons_screen.dart';
import 'package:portfolio/screens/palettes_screen/palettes_screen.dart';
import 'package:portfolio/shared/components.dart';

import '../screens/colors_extractor_screen/color_extractor_screen.dart';
import '../screens/copy_right_screen/copy_right_screen.dart';
import '../screens/palettes_finder_screen/palettes_finder_screen.dart';
import '../shared/styles/themes.dart';

class TableOfCategory extends StatelessWidget {
  const TableOfCategory({Key? key}) : super(key: key);


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
                  'assets/icons/Group 660.svg',
                  height: 22,
                ),
                index:  0,
                textTip:  'FONTS',
                onTap: (){

                    selectCategory(0);

                  navigateTo(context, FontsScreen());
                }

            ),
            buildItemOfCategory(
                icon:  SvgPicture.asset(
                  "assets/icons/Group 659.svg",
                  height: 26,
                ),
                index:   1,
                textTip:   'ICONS',
                onTap: (){

                    selectCategory(1);

                  navigateTo(context, IconsScreen());
                }
            ),
            buildItemOfCategory(
                icon: SvgPicture.asset(
                  "assets/icons/Group 664.svg",
                  height: 23,
                ),
                index:  2,
                textTip:  'COLOR BALETTES',
                onTap: (){

                    selectCategory(2);

                  navigateTo(context, PalettesScreen());
                }
            ),
            buildItemOfCategory(
                icon:   SvgPicture.asset(
                  "assets/icons/Group 662.svg",
                  height: 23,
                ),
                index:   3,
                textTip:   'GRADIENTS',
                onTap: (){

                    selectCategory(3);

                  navigateTo(context, GradientsScreen());
                }

            ),
            const Divider(
              endIndent: 10,
              indent: 10,
            ),
            buildItemOfCategory(
                icon:   SvgPicture.asset(
                  "assets/icons/Group 1374.svg",
                  height: 26,
                ),
                index:  4,
                textTip:  'COLOR INFORMATION',
                onTap: (){

                    selectCategory(4);

                  navigateTo(context, ColorInformation());
                }
            ),
            buildItemOfCategory(
                icon:   SvgPicture.asset(
                  "assets/icons/Group 1370.svg",
                  height: 26,
                ),
                index:  5,
                textTip: 'COLORS EXTRACTOR',
                onTap: (){

                    selectCategory(5);

                  navigateTo(context, ColorsExtractorScreen());
                }
            ),
            buildItemOfCategory(
                icon:  SvgPicture.asset(
                  "assets/icons/Group 5707.svg",
                  height: 30,
                  alignment: Alignment.centerLeft,

                ),
                index:  6,
                textTip:    'PALETTES FINDER',
                onTap: (){
                    selectCategory(6);

                  navigateTo(context, PalettesFinderScreen());
                }
            ),
            buildItemOfCategory(
                icon:  SvgPicture.asset(
                  "assets/icons/Group 5706.svg",
                  height: 27,
                ),
                index:  7,
                textTip:   'COPYRIGHT INFRINGEMENTS',
                onTap: (){
                    selectCategory(7);
                  navigateTo(context, CopyRightScreen());
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