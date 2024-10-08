import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';
import 'package:portfolio/custom_widgets/tool_bar_icons.dart';
import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/nav_bar_category.dart';
import '../../shared/styles/themes.dart';

class ColorInformation extends StatefulWidget {
   ColorInformation({Key? key}) : super(key: key);

  @override
  State<ColorInformation> createState() => _ColorInformationState();
}

class _ColorInformationState extends State<ColorInformation> {
  final ScrollController _scrollController =ScrollController();
  Color testColor =kPrimaryColor;
  final TextEditingController hexTextInputController =TextEditingController();
  String ?typeColorValue ='HEX';

  @override
  void initState() {
    super.initState();
//here you can init your variables

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //All dynamic operations that will impact on graphics
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(size.width,65),
        child: CustomAppBar(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarCategory(index:4),
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(6),
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Text('Color Information',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 22,
                          fontFamily: 'Arial Rounded MT',
                          height: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 380,
                        height: 300,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(3),
                           color: testColor,
                        ),
                      ),
                      SizedBox(
                        width: 380,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                controller: hexTextInputController,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                                cursorColor: Colors.black,
                                autofocus: true,
                                enableSuggestions: true,
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]!,
                                        width: 1,
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]!,
                                        width: 1,
                                      ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 5) ,
                              margin:const EdgeInsets.symmetric(horizontal: 0,vertical: 5) ,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:BorderRadius.circular(2)
                              ),
                              child: DropdownButton<String>(
                                elevation: 0,
                                borderRadius: BorderRadius.circular(5),
                                underline: Container(
                                  height: 1,
                                  color: Theme.of(context).primaryColor.withOpacity(.1),
                                ),
                                iconDisabledColor: Colors.transparent,
                                iconEnabledColor: Colors.transparent,
                                isExpanded: false,
                                iconSize:0,
                                dropdownColor: Colors.white,
                                alignment: Alignment.center,
                                style:  TextStyle(
                                    color:HexColor('#404456') ,
                                    fontFamily: 'Arial Rounded MT',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    height: 1
                                ) ,
                                value: typeColorValue,
                                items: [
                                  DropdownMenuItem(onTap: (){},value:'HEX',child:const Text('HEX')),
                                  DropdownMenuItem(onTap: (){},value:'RGB',child:const Text('RGB')),
                                  DropdownMenuItem(onTap: (){},value:'HSL',child:const Text('HSL')),
                                  DropdownMenuItem(onTap: (){},value:'HSB',child:const Text('HSB')),
                                  DropdownMenuItem(onTap: (){},value:'CMYK',child:const Text('CMYK')),
                                ],
                                onChanged:(String? newValue) {
                                  setState(() {
                                    typeColorValue=newValue;
                                  });

                                },
                              ),
                            ),
                            showColorPopUpMenu(),
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              color: Colors.blue,
                              borderRadius: 3,
                              text: 'RUN',
                              textSize: 20,
                              textColor: Colors.white,

                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                        Divider(indent: 300,endIndent: 300,color: Colors.grey[300]),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: 600,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              borderRadius: 5,
                              text: 'HEX',
                              textSize: 20,
                              textColor: kTextColor,

                            ),
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              borderRadius: 5,
                              text: 'RGB',
                              textSize: 20,
                              textColor: kTextColor,

                            ),
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              borderRadius: 5,
                              text: 'HSL',
                              textSize: 20,
                              textColor: kTextColor,

                            ),
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              borderRadius: 5,
                              text: 'HSB',
                              textSize: 20,
                              textColor: kTextColor,

                            ),
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              borderRadius: 5,
                              text: 'CMYK',
                              textSize: 20,
                              textColor: kTextColor,

                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              borderRadius: 5,
                              text: 'RAL',
                              textSize: 20,
                              textColor: kTextColor,

                            ),
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              borderRadius: 5,
                              text: 'LAB',
                              textSize: 20,
                              textColor: kTextColor,

                            ),
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              borderRadius: 5,
                              text: 'HKS',
                              textSize: 20,
                              textColor: kTextColor,

                            ),
                            MyCustomButton(
                              width: 100,
                              height: 40,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              onTap: (){},
                              borderRadius: 5,
                              text: 'WEBSAFE',
                              textSize: 20,
                              textColor: kTextColor,

                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
          const TableAdsAndHistory(),

        ],
      ),
    );
  }
  Widget showColorPopUpMenu(){
    return CustomPopupMenu(
      barrierColor: Colors.transparent,
      showArrow: false,
      verticalMargin: 0,
      horizontalMargin: 0,
      position: PreferredPosition.top,
      arrowColor: Colors.white,
      enablePassEvent: false,
      menuBuilder: (){
        return Container(
          height: 222,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3)
          ),
          child: Stack(
            children: [
              Container(
                padding:const EdgeInsets.all(3) ,
                height: 241,
                width: 250,
                child: ColorPicker(
                  pickerColor: testColor,
                  onColorChanged: (color) {
                    setState(() {
                      testColor=color;
                    });
                  },
                  enableAlpha: false,
                  paletteType: PaletteType.hsvWithHue,
                  portraitOnly: true,
                  //hexInputBar: true,
                  hexInputController: hexTextInputController,
                  showLabel: false,
                  labelTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),

                  pickerAreaBorderRadius: BorderRadius.circular(1),
                  pickerAreaHeightPercent: 0.5,
                  colorPickerWidth: 250,

                  displayThumbColor: true,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: hexTextInputController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                    cursorColor: Colors.black,
                    autofocus: true,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      suffixIcon: IconButton(
                        tooltip: 'copy',
                        hoverColor: Colors.transparent,
                        onPressed: () {

                        },
                        icon: const Icon(
                          Icons.paste_outlined,
                          color: Colors.black87,
                          size: 20,
                        ),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.tag,
                          color: Colors.black87,
                          size: 20,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kHoverColor,
                            width: 1,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kHoverColor,
                            width: 1,
                          )
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      pressType: PressType.singleClick,
      child: SvgPicture.string(forGraundIcon,
        height: 35,
        width: 35,
      ),
    );
  }

}
