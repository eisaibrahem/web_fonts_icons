import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';

class TableOfCategory extends StatefulWidget {


  @override
  State<TableOfCategory> createState() => _TableOfCategoryState();
}

class _TableOfCategoryState extends State<TableOfCategory> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: 75.12,
      height: size.height,
      child: Column(
        children: [
          buildItemOfCategory(
              SvgPicture.asset(
                'assets/icons/Group 660.svg',
                height: 22.5,
                width: 22.5,
              ),
              0,
              'FONTS'
          ),
          buildItemOfCategory(
              SvgPicture.asset(
                "assets/icons/Group 659.svg",
                height: 26.8,
                width: 26,
              ),
              1,
              'ICONS'
          ),
          buildItemOfCategory(
              SvgPicture.asset(
                "assets/icons/Group 664.svg",
                width: 24.2,
                height: 24.2,
              ),
              2,
              'COLOR BALETTES'
          ),
          buildItemOfCategory(
              SvgPicture.asset(
                "assets/icons/Group 662.svg",
                height: 24,
                width: 24,
              ),
              3,
              'GRADIENTS'
          ),
          const Divider(
            endIndent: 5,
            indent: 5,
          ),
          buildItemOfCategory(
              SvgPicture.asset(
                "assets/icons/Group 1374.svg",
                width: 26.2,
                height: 26.2,
              ),
              4,
              'COLOR INFORMATION'
          ),
          buildItemOfCategory(
              SvgPicture.asset(
                "assets/icons/Group 1370.svg",
                width: 26.9,
                height: 26.9,
              ),
              5,
              'COLORS EXTRACTOR'
          ),
          buildItemOfCategory(
              SvgPicture.asset(
                "assets/icons/Group 5707.svg",
                height: 28,
                width: 28,
              ),
              6,
              'PALETTES FINDER'
          ),
          buildItemOfCategory(
              SvgPicture.asset(
                "assets/icons/Group 5706.svg",
                width: 28,
                height: 28,
              ),
              7,
              'COPYRIGHT INFRINGEMENTS'
          ),
        ],
      )
    );

  }

  Widget buildItemOfCategory(Widget icon, int index,String textTip) {
    return JustTheTooltip(
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
        child:  Text(textTip,
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
        onHover: (val) {},
        onTap: () {
          setState(() {
            selectCategory(index);
          });
          HomeScreen.pageController.jumpToPage(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 42.29,
          color: selected[index]
              ? Theme.of(context).primaryColor
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
              SizedBox(
                width: selected[index] ? 15: 20,
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

  List<bool> selected = [true, false, false, false, false, false, false, false,];
  void selectCategory(int n) {
    for (int i = 0; i < 8; i++) {
      if (i == n) {
        setState(() {
          selected[i] = true;
        });

      } else {
        setState(() {
          selected[i] = false;
        });

      }
    }
  }

}
