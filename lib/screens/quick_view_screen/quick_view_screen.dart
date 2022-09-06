import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/custom_widgets/custom_buttons/save_button.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/shared/styles/themes.dart';
import '../../custom_widgets/custom_buttons/my_custom_button.dart';
import '../../custom_widgets/my_custom_pupup_item.dart';

class QuickViewScreen extends StatelessWidget {
  bool isIconsScreen;
   QuickViewScreen({
    this.isIconsScreen=false,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                icon: const Icon(Icons.clear,
                  size: 20,
                  color: Colors.black,
                ),
                  ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Quick View',
                  style: TextStyle(
                      fontFamily: 'Arial Rounded MT',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomPopupMenu(
                  arrowColor: Colors.white,
                  verticalMargin: 0,
                  enablePassEvent: false,
                  barrierColor: Colors.transparent,
                  menuBuilder: () {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          isIconsScreen?MyCustomPopUpItem(
                            onTap: () {

                            },
                            svg:disLikeSVG,
                            text:'Save Icon' ,

                          ) :MyCustomPopUpItem(
                              onTap: () {

                              },
                              svg:disLikeSVG,
                              text:'Save Font' ,

                          ),
                          isIconsScreen?MyCustomPopUpItem(
                            onTap: (){

                            },
                            height: 40,
                            text:'Copy Icon ID',
                            icon:Icons.copy,

                          ) :MyCustomPopUpItem(
                            onTap: (){

                             },
                            height: 40,
                            text:'Copy Font ID',
                            icon:Icons.copy,

                             ),
                          MyCustomPopUpItem(
                              onTap: () {

                              },
                              height: 40,
                              icon: Icons.menu,
                              text:  'Explore Similar',
                          ),
                        ],
                      ),
                    );
                  },
                  pressType: PressType.singleClick,
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: kPrimaryColor,
            height:isIconsScreen? 280:300,
            width:isIconsScreen?400:600,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child:isIconsScreen? const Icon(
              Icons.sports_baseball,
              size: 150,
              color: Colors.black,
            ) :const Text(
              'ZOOMA',
              style: TextStyle(
                fontSize: 70,
              ),
            ),
          ),
          isIconsScreen?Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: MyCustomButton(
                  onTap: (){},
                  borderRadius: 3,
                  height: 20,
                  width: 60,
                  text: 'PDF',
                  textSize: 16,
                  paddingHorizontal: 8,
                  paddingVertical: 2,
                  marginVertical: 10,
                ),
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 20,
                width: 60,
                text: 'PDF',
                textSize: 16,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 20,
                width: 60,
                text: 'PDF',
                textSize: 16,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 20,
                width: 60,
                text: 'PDF',
                textSize: 16,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom: 10,right: 10),
                child: SaveButton(
                  width: 60,
                  height: 40,
                  borderRadius: 3,
                  color: kPrimaryColor,
                  iconsSize: 30,
                ),
              )
            ],
          )
              :Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 430,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyCustomButton(
                      borderRadius: 3,
                      paddingHorizontal: 3,
                      marginHorizontal: 0,
                      height: 50,
                      elevation: 0,
                      iconWidget: Icon(
                        Icons.arrow_back_ios,
                        color: kTextColor,
                        size: 15,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              10,
                              (index) {
                                return MyCustomButton(
                                  onTap: () {},
                                  borderRadius: 3,
                                  marginHorizontal: 3,
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                  text: 'A',
                                  textSize: 20,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    MyCustomButton(
                      borderRadius: 3,
                      paddingHorizontal: 3,
                      marginHorizontal: 0,
                      height: 50,
                      elevation: 0,
                      iconWidget: Icon(
                        Icons.arrow_forward_ios,
                        color: kTextColor,
                        size: 15,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const Spacer(),
              MyCustomButton(
                onTap: () {},
                height: 50,
                width: 50,
                borderRadius: 3,
                iconSize: 28,
                icon: Icons.download,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SaveButton(
                  iconsSize: 33,
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

const String cancelSVG =
    '''<svg id="Group_683" data-name="Group 683" xmlns="http://www.w3.org/2000/svg" width="18.333" height="18.333" viewBox="0 0 18.333 18.333">
  <path id="Line_36" data-name="Line 36" d="M16.168,17.7-.636.891.891-.636l16.8,16.8Z" transform="translate(0.636 0.636)"/>
  <path id="Line_36-2" data-name="Line 36" d="M16.169-.636-.636,16.168.891,17.7,17.7.891Z" transform="translate(0.636 0.636)"/>
</svg>
''';
