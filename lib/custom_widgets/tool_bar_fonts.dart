import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_cubit.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import '../screens/fonts_screen/fonts_cubit/fonts_states.dart';
import '../screens/palettes_screen/blocky_color.dart';
import '../shared/styles/themes.dart';

class ToolBarDetailsScreen extends StatelessWidget {
final bool isPupular;
final bool ispopup;
final bool isBackGround;
final bool isAlignmentEdit;

ToolBarDetailsScreen({
  this.isPupular=true,
  this.ispopup=true,
  this.isBackGround=true,
  this.isAlignmentEdit=true,
});


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<FontsCubit, FontsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        FontsCubit cubit=FontsCubit.get(context);
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          color: Colors.white,
          elevation: 0.5,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: size.width,
            height: 60,
            child: Row(
              children: [
                buildTextFieldForTestText(size, cubit),
                buildSliderForChangeTextSize(cubit, size),
                const SizedBox(
                  width: 10,
                ),

                ispopup? showColorPiker(context,cubit):InkWell(
                  onTap: (){
                    cubit.changPaletToColorPalet();
                    cubit.useColorPecker();
                  },
                  child: SvgPicture.asset("assets/icons/text-color-logo.svg",
                    width: 40,),
                ),

                const SizedBox(
                  width: 15,
                ),
                isBackGround?InkWell(
                  onTap: (){
                  cubit.changPaletToColorPalet();
                  cubit.useBackGraundPalet();
                  },
                  child: SvgPicture.string(backGraundColor,
                    height: 30,
                    width: 30,
                  ),
                ):Container(),
                 SizedBox(
                  width:isBackGround? 15:0,
                ),

             ispopup?showGradientColorPiker(context,cubit):InkWell(
               onTap: (){
                 cubit.changPaletToGradientPalet();
               },
               child: SvgPicture.asset(
                   "assets/icons/gradient-svgrepo-com(1).svg",
                   width: 40),
             ),
                 SizedBox(
                  width:isAlignmentEdit? 10:0,
                ),
                isAlignmentEdit?Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(3)
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap:(){
                          cubit.changeAlignment(alignment:Alignment.centerLeft);
                        },
                        child: const Icon(Icons.format_align_left_sharp,
                        color: Colors.grey,
                          size: 26,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap:(){
                          cubit.changeAlignment(alignment:Alignment.center);
                        },
                        child: const Icon(Icons.format_align_center_sharp,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap:(){
                          cubit.changeAlignment(alignment:Alignment.centerRight);
                        },
                        child: const Icon(Icons.format_align_right_sharp,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ):Container(),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  tooltip: 'Reset',
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    cubit.resetColorAndSizeFontTest();
                  },
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset("assets/icons/reset-logo.svg",
                      width: 40),
                ),
                const Spacer(),
                (isPupular)?
                Container(
                  height: 60,
                  padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10) ,
                  width: size.width*0.1,
                    constraints: BoxConstraints(
                        maxWidth: 300
                    ),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius:BorderRadius.circular(1)
                  ),
                  child: DropdownButton<String>(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(5),
                    underline: Container(
                      height: 1,
                      color: Theme.of(context).primaryColor.withOpacity(.1),
                    ),
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    iconEnabledColor:HexColor('#404456'),
                    iconSize:22,
                    dropdownColor: Colors.white,
                    alignment: Alignment.center,
                    style:  TextStyle(
                      color:HexColor('#404456') ,
                      fontFamily: 'Arial Rounded MT',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1
                    ) ,
                    value: cubit.popularValue,
                    items: [
                      DropdownMenuItem(onTap: (){},value:'Popular',child:const Text('Popular')),
                      DropdownMenuItem(onTap: (){},value:'Trending',child:const Text('Trending')),
                      DropdownMenuItem(onTap: (){},value:'Featured',child:const Text('Featured')),
                    ],
                    onChanged:(String? newValue) {
                      cubit.changePopularValue(newValue);
                    },
                  ),
                ):Row(
                  children: [
                    SvgPicture.string(
                      signDular,
                      height: 17,
                      width: 17,
                    ),
                    const SizedBox(width: 3,),
                    Text(
                      'By : Mark Goldbridge',
                      style: TextStyle(
                        fontFamily: 'Microsoft Tai Le',
                        fontSize: 14,
                        color: kTextColor,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },

    );
  }
  Widget buildTextFieldForTestText(Size size, FontsCubit cubit) {
    return Container(
      width: size.width * 0.16,
      constraints: BoxConstraints(
          maxWidth: 380
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: kPrimaryColor,
      ),
      child: TextField(
        textAlign: TextAlign.start,
        controller: FontsScreen.testFontController,
        onChanged: (value) {
          cubit.changeTextValueTest(value);
        },
        style: const TextStyle(fontSize: 18, color: Colors.black),
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          hintText: 'write any word ...',
          hintTextDirection: TextDirection.ltr,
          hintStyle: TextStyle(
            fontSize: 16,
            color: kTextColor,
          ),
          alignLabelWithHint: true,
          suffixIcon: Container(
            constraints: const BoxConstraints(
              maxWidth: 50,
              minWidth: 30,
            ),
            width: size.width * 0.070,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 0.5,
                  height: 34,
                  color: Colors.grey,
                ),
                SizedBox(width: 5,),
                InkWell(
                  onTap: () {
                    cubit.clearTextTest();
                  },
                  child: Icon(
                    Icons.clear,
                    color:FontsScreen.testFontController.text==''? Colors.grey:Colors.black,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildSliderForChangeTextSize(FontsCubit cubit, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.16,
        constraints: BoxConstraints(
            maxWidth: 380
        ),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 5,),
          const Text(
            'A',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Slider(
              value: cubit.fontSizeValueTest,
              activeColor: Colors.blue[100],
              inactiveColor: Colors.grey,
              thumbColor: Colors.blue,
              onChanged: (value) {
                cubit.changeFontsSizedValueTest(value);
              },
              min: 0.0,
              max: 18.0,
              divisions: 18,
              label:"${cubit.fontSizeValueTest*5}",


            ),
          ),
          const Text(
            'A',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
         const SizedBox(width: 5,),

        ],
      ),
    );
  }

  Widget showColorPiker(BuildContext context, FontsCubit cubit) {
    return CustomPopupMenu(
      barrierColor: Colors.transparent,
      showArrow: false,
      verticalMargin: 5,
      horizontalMargin: 5,
      position: PreferredPosition.bottom,
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
                  pickerColor: cubit.testColor,
                  onColorChanged: (color) {
                    cubit.changeTestTextColor(color);
                  },
                  enableAlpha: false,
                  paletteType: PaletteType.hsvWithHue,
                  portraitOnly: true,
                  //hexInputBar: true,
                  hexInputController: FontsScreen.hexTextInputController,
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
                    controller: FontsScreen.hexTextInputController,
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
                          Clipboard.setData(
                              ClipboardData(text: FontsScreen.hexTextInputController.text));
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
      child: SvgPicture.asset("assets/icons/text-color-logo.svg",
        width: 40,),
    );
  }
  Widget showGradientColorPiker(BuildContext context, FontsCubit cubit) {
    return CustomPopupMenu(
        barrierColor: Colors.transparent,
        verticalMargin: 5,
        showArrow: false,
        enablePassEvent: false,
        position: PreferredPosition.bottom,
        menuBuilder: (){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            height: 205,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 30,
                  margin: const EdgeInsets.all(5),
                  alignment:Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: kPrimaryColor,
                  ) ,

                  child: const Text(
                    'Select Colors',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                MultipleChoiceBlockPicker(
                  onColorsChanged: (List<Color> value) {
                    cubit.changeTestTextGradient(value);
                  },
                  pickerColors: cubit.listOfTestTextColors,
                  availableColors: colors,
                  useInShowDialog: true,
                  layoutBuilder: ( context,  colors, PickerItem child) {
                    Orientation orientation = MediaQuery.of(context).orientation;
                    return Container(
                      width: 200,
                      height: 160,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: GridView.count(
                        crossAxisCount: 5,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                        children: [for (Color color in colors) child(color)],
                      ),
                    );
                  },
                  itemBuilder:(Color color, bool isCurrentColor, void Function() changeColor) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: color,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: changeColor,
                          borderRadius: BorderRadius.circular(50),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 250),
                            opacity: isCurrentColor ? 1 : 0,
                            child: Icon(
                              Icons.done,
                              size: 16,
                              color: useWhiteForeground(color) ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  } ,



                ),
              ],
            ),
          );
        },
        pressType: PressType.singleClick,
        child: SvgPicture.asset(
            "assets/icons/gradient-svgrepo-com(1).svg",
            width: 40));
  }

}

String backGraundColor='''<svg id="Group_793" data-name="Group 793" xmlns="http://www.w3.org/2000/svg" width="46.914" height="46.049" viewBox="0 0 46.914 46.049">
  <g id="Group_748" data-name="Group 748" transform="translate(0)">
    <g id="Group_747" data-name="Group 747" transform="translate(14.511 13.647)">
      <rect id="Rectangle_788" data-name="Rectangle 788" width="32.402" height="32.402" rx="2" fill="#ff0c3e"/>
      <rect id="Rectangle_789" data-name="Rectangle 789" width="16.201" height="18.226" rx="1" transform="translate(8.101 7.088)" fill="#fff"/>
    </g>
    <rect id="Rectangle_787" data-name="Rectangle 787" width="32.083" height="32.083" rx="2" fill="#4285f4"/>
    <g id="Group_746" data-name="Group 746" transform="translate(34.255 0.443)">
      <path id="Path_592" data-name="Path 592" d="M449.771,99.678l2.507-4.342h-5.013Z" transform="translate(-440.22 -87.619)" fill="#4285f4"/>
      <path id="Path_593" data-name="Path 593" d="M367.544,10.507l4.342,2.507V8Z" transform="translate(-367.544 -8)" fill="#4285f4"/>
    </g>
  </g>
  <path id="Path_606" data-name="Path 606" d="M404.861,35.436h-1.318V30.577a.894.894,0,0,0-.892-.892h-4.859V28.368h4.859a2.213,2.213,0,0,1,2.21,2.209Z" transform="translate(-360.518 -26.198)" fill="#4285f4"/>
</svg>
''';


