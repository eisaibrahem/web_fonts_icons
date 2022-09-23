import 'dart:math';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:portfolio/custom_widgets/custom_buttons/save_button.dart';
import 'package:portfolio/screens/palettes_screen/palettes_details_screen.dart';
import 'package:portfolio/shared/components.dart';
import 'package:portfolio/shared/styles/themes.dart';

import '../screens/fonts_screen/fonts_screen.dart';
import '../screens/quick_view_screen/quick_view_screen.dart';
import 'my_custom_pupup_item.dart';

class ItemColorsPalette extends StatefulWidget {
  const ItemColorsPalette({Key? key}) : super(key: key);

  @override
  State<ItemColorsPalette> createState() => _ItemColorsPaletteState();
}

class _ItemColorsPaletteState extends State<ItemColorsPalette> {
  CustomPopupMenuController customPopupMenuController =CustomPopupMenuController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)
          ),
          child: InkWell(
              onTap: (){
                navigateTo(context, PalettesDetailsScreen());
              },
              child: buildListOFColorsPalette()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            SaveButton(
              color:Colors.white,
              width: 32,
              height: 32,
              iconsSize: 26,
            ),
            const Padding(
              padding: EdgeInsets.all(3.0),
              child: Text('50.6k',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomPopupMenu(
                controller: customPopupMenuController,
                arrowColor: kPrimaryColor,
                horizontalMargin:0 ,
                verticalMargin: 0,
                enablePassEvent: false,
                barrierColor: Colors.transparent,
                menuBuilder: () {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        MyCustomPopUpItem(

                          onTap: (){
                            customPopupMenuController.hideMenu();
                            showQuickScreen(isPalettesScreen:true ,isIconsScreen: false,context: context,isGradientScreen: false);
                          },

                          height: 30,
                          text:'Quick View',
                          textSize: 13,
                          iconSize: 20,
                          width: 150,

                          icon:Icons.remove_red_eye_outlined,

                        ),
                        MyCustomPopUpItem(
                          onTap: (){

                          },
                          width: 150,
                          height: 30,
                          text:'Copy Palette ID',
                          icon:Icons.copy,
                          textSize: 13,
                          iconSize: 20,

                        ),
                        MyCustomPopUpItem(
                          onTap: (){

                          },
                          width: 150,
                          height: 30,
                          textSize: 13,
                          iconSize: 20,
                          text:'Download Image',
                          icon:Icons.download,

                        ),
                        MyCustomPopUpItem(
                          onTap: () {

                          },
                          width: 150,
                          height: 30,
                          icon: Icons.menu,
                          textSize: 13,
                          iconSize: 20,
                          text:  'Explore Similar',
                        ),
                        MyCustomPopUpItem(
                          onTap: () {

                          },
                          width: 150,
                          textSize: 13,
                          text:'Save Font' ,
                          height: 30,
                          heightSVG: 20,
                          widthSVG: 20,

                        ),
                      ],
                    ),
                  );
                },
                pressType: PressType.singleClick,
                child: const Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                  size: 28,
                ),
              ),
            ),


          ],
        ),
      ],
    );
  }

}
Widget  buildListOFColorsPalette({int? numberOfColor, String? hexColor}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: List.generate(6, (index) {
      return PaletteColor(index: index,);
    }),
  );
}

class PaletteColor extends StatefulWidget {
 final int ?index;
 final String? hexColor;

 PaletteColor({
   this.index,
   this.hexColor
});

  @override
  State<PaletteColor> createState() => _PaletteColorState();
}

class _PaletteColorState extends State<PaletteColor> {
  final Color _color =Colors.primaries[Random.secure().nextInt(Colors.primaries.length)];
  bool isHover=false;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: isHover?2:1,
      child: MouseRegion(
        onEnter: (f){
          setState(() {
            isHover=true;
          });
        },
        onExit: (f){
          setState(() {
            isHover=false;
          });
        },
        child: AnimatedContainer(
          alignment: Alignment.center,
          //width: isHover?123:83,
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.only(
                topRight:widget.index==5? const Radius.circular(5):const Radius.circular(0),
                topLeft: widget.index==0? const Radius.circular(5):const Radius.circular(0),
                bottomLeft:widget.index==0? const Radius.circular(5):const Radius.circular(0),
                bottomRight:widget.index==5? const Radius.circular(5):const Radius.circular(0),
            ),
          ),
          child:isHover? Text('${_color.value}',
          style:  TextStyle(
            fontSize: 12,
           color: useWhiteForeground(_color) ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold
          ),
          ):const SizedBox(),

        ),
      ),
    );
  }
}
