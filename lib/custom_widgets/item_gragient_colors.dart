import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/shared/components.dart';

import '../screens/fonts_screen/fonts_screen.dart';
import '../screens/gradients_screen/gradient_details_screen.dart';
import '../screens/quick_view_screen/quick_view_screen.dart';
import '../shared/styles/themes.dart';
import 'custom_buttons/save_button.dart';
import 'custom_tost.dart';
import 'my_custom_pupup_item.dart';

class ItemGragientColors extends StatefulWidget {

  @override
  State<ItemGragientColors> createState() => _ItemGragientColorsState();
}

class _ItemGragientColorsState extends State<ItemGragientColors> {
  CustomPopupMenuController customPopupMenuController =CustomPopupMenuController();
  final toast=FToast();
  bool isHover=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toast.init(context);
  }

  void showBottomToast(){
    toast.showToast(
        child: MyCustomToast(),
        positionedToastBuilder: (context,child){
          return Positioned(child: child, bottom: 10,left: 510,);
        }
    );
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        MouseRegion(
          onEnter: (event) {
            setState(() {
              isHover=true;
            });

          },
          onExit: (event) {
            setState(() {
              isHover=false;
            });
          },
          child: Stack(
            children: [
              InkWell(
                onTap: (){
                  navigateTo(context, GradientDetailsScreen());
                },
                child: Container(
                  height: 200,
                  width: 230,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFF3366FF),
                          Color(0xFF00CCFF),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                ),
              ),
              isHover? Positioned(
                top: 10,
                left: 10,
                child: InkWell(
                  onTap: (){
                    showBottomToast();
                    Clipboard.setData(ClipboardData(text: 'ok copy'));
                  },
                  child: const Icon(
                    Icons.copy,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ):const SizedBox(),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 25,
          width: 230,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Row(
                children:List.generate(3, (index)
                =>  Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                   onTap: (){
                     showBottomToast();
                     Clipboard.setData(ClipboardData(text: 'ok copy'));
                   },
                    child: const CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      radius: 8,
                    ),
                  ),
                ),
                ),
              ),
              const Spacer(),
              SaveButton(
                color:Colors.white,
                width: 33,
                height: 25,
                iconsSize: 30,
                paddingVertical: 0,

              ),
              const Text('50.6k ',
                style: TextStyle(
                    color: Colors.grey,
                    height: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
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
                              showQuickScreen(
                                  isPalettesScreen:false ,
                                  isIconsScreen: false,
                                  context: context,
                                  isGradientScreen:true
                              );
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
                            widthSVG: 20,
                            heightSVG: 20 ,

                          ),
                        ],
                      ),
                    );
                  },
                  pressType: PressType.singleClick,
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                    size: 26,
                  ),
                ),
              ),




            ],
          ),
        ),

      ],
    );
  }
}
