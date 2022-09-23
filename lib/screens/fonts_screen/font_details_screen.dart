import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/custom_widgets/list_view_of_fonts.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_cubit.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_states.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../custom_widgets/custom_buttons/my_custom_button.dart';
import '../../custom_widgets/custom_buttons/save_button.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/nav_bar_category.dart';
import '../../custom_widgets/tool_bar_fonts.dart';
import '../../shared/styles/themes.dart';
import '../home_screen/cubit/home_cubit.dart';
import '../home_screen/cubit/home_state.dart';
import '../../custom_widgets/custom_app_bar.dart';
import '../palettes_screen/blocky_color.dart';

class FontDetailsScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  BlocConsumer<FontsCubit,FontsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        FontsCubit cubit=FontsCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: PreferredSize(
              preferredSize: Size(size.width,65),
              child: CustomAppBar(),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NavBarCategory(),

                Expanded(
                  child:ListView(
                    children: [
                      const SizedBox(height: 5,),
                      ToolBarDetailsScreen( isPupular: false,ispopup: false),
                      Card(
                        elevation: 0.5,
                        margin: const EdgeInsets.all(5),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              height: 300,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(3)
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          margin: const EdgeInsets.only(right: 10),
                                          width:size.width,
                                          height: 230,
                                          color: cubit.backGraundColor,
                                          alignment: Alignment.centerLeft,
                                          child:  (cubit.listOfTestTextColors.length > 1)
                                              ?
                                          GradientText(
                                            overflow: TextOverflow.clip,
                                            (cubit.testText != '')
                                                ? FontsScreen.testFontController.text
                                                : 'Write any Word ',
                                            style: TextStyle(
                                              fontSize: 5 * cubit.fontSizeValueTest,

                                            ),
                                            colors: cubit.listOfTestTextColors,
                                          )
                                              : Text(
                                            (cubit.testText != '')
                                                ? FontsScreen.testFontController.text
                                                : 'Write any Word ',
                                            style: TextStyle(
                                                fontSize: 5 * cubit.fontSizeValueTest,
                                                color:
                                                cubit.listOfTestTextColors.length == 1
                                                    ? cubit.listOfTestTextColors[0]
                                                    : cubit.testColor),
                                          ),
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Container(
                                              margin:
                                              const EdgeInsets.symmetric(horizontal: 10,),
                                              width: 420,
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  MyCustomButton(
                                                    borderRadius: 3,
                                                    paddingHorizontal: 3,
                                                    marginHorizontal: 0,
                                                    color: Colors.white,
                                                    height: 40,
                                                    iconWidget: Icon(
                                                      Icons.arrow_back_ios,
                                                      color: kTextColor,
                                                      size: 15,
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 40,
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
                                                    width: 1,
                                                  ),
                                                  MyCustomButton(
                                                    color: Colors.white,
                                                    borderRadius: 3,
                                                    paddingHorizontal: 3,
                                                    marginHorizontal: 0,
                                                    height: 40,
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
                                              text: 'SVG',
                                              textSize: 17,
                                              height: 40,
                                              width: 60,
                                              fontFamily: 'Arial Rounded MT',
                                              color: Colors.white,
                                              borderRadius: 3,
                                            ),
                                            const SizedBox(width: 10,),
                                            MyCustomButton(
                                              onTap: () {},
                                              color: Colors.white,
                                              width: 60,
                                              height: 40,
                                              borderRadius: 3,
                                              iconSize: 28,
                                              icon: Icons.download,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: SaveButton(
                                                color: Colors.white,
                                                iconsSize: 33,
                                                width: 60,
                                                height: 40,
                                              ),
                                            ),

                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 300,
                                    width: 250,
                                    margin: const EdgeInsets.only(right: 8,top: 8,bottom: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3)
                                    ),
                                    child:cubit.isGradientPicker?
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      width: 270,
                                      height: 270,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 270,
                                            height: 40,
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
                                                  fontSize: 18,
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
                                                width: 260,
                                                height: 220,
                                                padding: const EdgeInsets.all(10),
                                                margin: const EdgeInsets.all(5),
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
                                          // Container(
                                          //   height: 30,
                                          //   margin: const EdgeInsets.symmetric(horizontal: 5),
                                          //   padding: const EdgeInsets.only(left: 5),
                                          //   decoration: BoxDecoration(
                                          //       color: kPrimaryColor,
                                          //       borderRadius: BorderRadius.circular(5)
                                          //   ),
                                          //   child: Row(
                                          //     mainAxisAlignment:MainAxisAlignment.center ,
                                          //     children: [
                                          //       Text('0',style: TextStyle(
                                          //         color: kTextColor,
                                          //         fontSize: 14,
                                          //       )),
                                          //       SfSlider(
                                          //         showDividers: false,
                                          //         activeColor: Colors.blue[100],
                                          //         inactiveColor: Colors.grey,
                                          //         min: -2.0,
                                          //         max: 2.0,
                                          //         value: cubit.angelGradient,
                                          //         interval: 20,
                                          //         showTicks: false,
                                          //         showLabels: false,
                                          //         enableTooltip: false,
                                          //         minorTicksPerInterval: 1,
                                          //         onChanged: ( value){
                                          //           cubit.changeAngelGradient(value);
                                          //         },
                                          //       ),
                                          //       Text('360',style: TextStyle(
                                          //         color: kTextColor,
                                          //         fontSize: 14,
                                          //       )),
                                          //     ],
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    )
                                        :Stack(
                                      children: [
                                        Container(
                                          padding:const EdgeInsets.all(5) ,
                                          height: 270,
                                          width: 270,
                                          child: ColorPicker(
                                            pickerColor:cubit.isBackGraundColor?cubit.backGraundColor: cubit.testColor,
                                            onColorChanged: (color) {
                                              if(cubit.isBackGraundColor) {
                                                cubit.changeBackGraundColor(color);
                                              }else{
                                                cubit.changeTestTextColor(color);
                                              }
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
                                            pickerAreaHeightPercent: 0.65,
                                            colorPickerWidth: 270,

                                            displayThumbColor: true,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            margin: const EdgeInsets.symmetric(vertical: 5),
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
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Text('Explore Another Fonts',
                                style: TextStyle(
                                  fontFamily: 'Arial Rounded MT',
                                  fontSize: 22,
                                  color: kTextColor,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListViewOfFonts();
                              },
                              itemCount: 20,
                            )
                          ],
                        ),
                      ),

                    ],
                  ) ,
                ),

                const TableAdsAndHistory(),
              ],
            ),
          ),
        ) ;
      },

    );
  }

}
