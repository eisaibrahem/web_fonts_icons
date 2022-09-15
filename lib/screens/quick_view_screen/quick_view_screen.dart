import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/custom_widgets/custom_buttons/save_button.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/shared/styles/themes.dart';
import '../../custom_widgets/custom_buttons/my_custom_button.dart';
import '../../custom_widgets/item_palette.dart';
import '../../custom_widgets/my_custom_pupup_item.dart';

class QuickViewScreen extends StatelessWidget {
 final  bool isIconsScreen;
 final  bool isPalettesScreen;
 final  bool isGradientScreen;

   QuickViewScreen({Key? key,
    required this.isIconsScreen,
    required this.isPalettesScreen,
    required this.isGradientScreen,

  }) : super(key: key);

  final ScrollController scrollQuickViewCategoryController =ScrollController();
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
                  arrowColor: kPrimaryColor,
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
                            onTap: () {
                              if(isIconsScreen){

                              }
                              else if(isPalettesScreen){

                              }else{

                              }

                            },
                            text:isIconsScreen?'Save Icon':isPalettesScreen?'Save Palette':isGradientScreen? 'Save Gradient':'Save Font' ,
                            textSize:15 ,
                            widthSVG:20 ,
                            heightSVG: 20,
                            width: 180,
                          ),
                          MyCustomPopUpItem(
                            onTap: (){
                              if(isIconsScreen){

                              }
                              else if(isPalettesScreen){

                              }else{

                              }
                            },
                            height: 40,
                            text:isIconsScreen?'Copy Icon ID':isPalettesScreen?'Copy Palette ID':isGradientScreen?'Copy Gradient ID':'Copy Font ID',
                            icon:Icons.copy,
                            iconSize: 18,
                            textSize: 15,
                            width: 180,

                          ),
                          MyCustomPopUpItem(
                              onTap: () {
                                if(isIconsScreen){

                                }
                                else if(isPalettesScreen){

                                }else{

                                }
                              },
                            width: 180,
                              height: 40,
                              icon: Icons.file_download_outlined,
                              text:  isIconsScreen?'Download Icon':isPalettesScreen?'Download Palette':isGradientScreen? 'Download Gradient':'Download Font',
                               iconSize: 20,
                              textSize: 15,
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
            color:isPalettesScreen?Colors.white: kPrimaryColor,
            height:(isIconsScreen||isPalettesScreen)? 280:300,
            width:(isIconsScreen||isGradientScreen)?400:600,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child:isIconsScreen? const Icon(
              Icons.sports_baseball,
              size: 150,
              color: Colors.black,
            ) :isPalettesScreen? buildListOFColorsPalette():
            isGradientScreen? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 380,
                  margin: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
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
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:List.generate(3, (index)
                  => const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      radius: 10,
                    ),
                  ),
                  ),
                ),
              ],
            ):const Text(
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
                  height: 40,
                  width: 70,
                  text: 'PDF',
                  textSize: 17,
                  paddingHorizontal: 8,
                  paddingVertical: 2,
                  marginVertical: 10,
                ),
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'JPG',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'PNG',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'SVG',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom: 10,right: 10),
                child: SaveButton(
                  width: 70,
                  height: 40,
                  borderRadius: 3,
                  color: kPrimaryColor,
                  iconsSize: 32,
                ),
              )
            ],
          ) :isPalettesScreen?Row(
            children: [
              const SizedBox(width: 8,),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'HEX',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              const SizedBox(width: 8,),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'HSB',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              const SizedBox(width: 8,),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'HSL',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              const SizedBox(width: 8,),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'RGB',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              const SizedBox(width: 8,),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'CMYK',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
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
          ) :isGradientScreen?Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10,),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'HEX',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'HSB',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'HSL',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'RGB',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              MyCustomButton(
                onTap: (){},
                borderRadius: 3,
                height: 40,
                width: 70,
                text: 'CMYK',
                textSize: 17,
                paddingHorizontal: 8,
                paddingVertical: 2,
                marginVertical: 10,
              ),
              const SizedBox(width: 10,)
            ],
          ) :Row(
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
                      iconWidget: Icon(
                        Icons.arrow_back_ios,
                        color: kTextColor,
                        size: 15,
                      ),
                      onTap: (){
                        scrollQuickViewCategoryController.animateTo(-500, duration: Duration(milliseconds: 500),curve: Curves.easeIn);
                      },
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
                          controller: scrollQuickViewCategoryController,
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
                      iconWidget: Icon(
                        Icons.arrow_forward_ios,
                        color: kTextColor,
                        size: 15,
                      ),
                      onTap: (){
                        scrollQuickViewCategoryController.animateTo(500, duration: Duration(milliseconds: 500),curve: Curves.easeIn);
                      },
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
