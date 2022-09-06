import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_cubit.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_states.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../custom_widgets/custom_buttons/my_custom_button.dart';
import '../../custom_widgets/custom_buttons/save_button.dart';
import '../../custom_widgets/table_of_category.dart';
import '../../custom_widgets/tool_bar_fonts.dart';
import '../../shared/styles/themes.dart';
import '../color_palettes_screen/blocky_color.dart';
import '../home_screen/cubit/home_cubit.dart';
import '../home_screen/cubit/home_state.dart';
import '../../custom_widgets/custom_app_bar.dart';

class FontDetailsScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: PreferredSize(
              preferredSize: Size(screenSize.width, screenSize.width*0.050),
              child: CustomAppBar(),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TableOfCategory(),

                BlocConsumer<FontsCubit,FontsStates>(
                  listener: (context, state) {

                  },
                  builder: (context, state) {
                    FontsCubit fontsCubit=FontsCubit.get(context);
                    return  Expanded(
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
                                              width:screenSize.width,
                                              height: 230,
                                              color: fontsCubit.backGraundColor,
                                              alignment: Alignment.centerLeft,
                                              child:  (fontsCubit.listOfTestTextColors.length > 1)
                                                  ? GradientText(
                                                overflow: TextOverflow.clip,
                                                (fontsCubit.testText != '')
                                                    ? FontsScreen.testFontController.text
                                                    : 'Write any Word ',
                                                style: TextStyle(
                                                  fontSize: 5 * fontsCubit.fontSizeValueTest,
                                                ),
                                                colors: fontsCubit.listOfTestTextColors,
                                              )
                                                  : Text(
                                                (fontsCubit.testText != '')
                                                    ? FontsScreen.testFontController.text
                                                    : 'Write any Word ',
                                                style: TextStyle(
                                                    fontSize: 5 * fontsCubit.fontSizeValueTest,
                                                    color:
                                                    fontsCubit.listOfTestTextColors.length == 1
                                                        ? fontsCubit.listOfTestTextColors[0]
                                                        : fontsCubit.testColor),
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
                                                        elevation: 0,
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
                                        child:fontsCubit.isGradientPicker?
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
                                                  fontsCubit.changeTestTextGradient(value);
                                                },
                                                pickerColors: fontsCubit.listOfTestTextColors,
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
                                                pickerColor:fontsCubit.isBackGraundColor?fontsCubit.backGraundColor: fontsCubit.testColor,
                                                onColorChanged: (color) {
                                                  if(fontsCubit.isBackGraundColor) {
                                                    fontsCubit.changeBackGraundColor(color);
                                                  }else{
                                                    fontsCubit.changeTestTextColor(color);
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
                                    return FontsScreen.buildItemOfListView(screenSize,fontsCubit,context);
                                  },
                                  itemCount: 20,
                                )
                              ],
                            ),
                          ),

                        ],
                      ) ,
                    );
                  },

                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3)),
                  margin: const EdgeInsets.only(right: 5, bottom: 5, top: 5),
                  padding: const EdgeInsets.all(5),
                  width: screenSize.width * 0.22,
                  height: screenSize.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        constraints: const BoxConstraints(
                          maxHeight: 270,
                          minHeight: 200,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.network(
                            'https://angartwork.akamaized.net/webp/?id=153545060&size=296',
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.width,
                        height: 45,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              HomeScreen.buildCategoryItemHistory(context,
                                  'assets/icons/Group 660.svg', 0, cubit),
                              const SizedBox(width: 10,),
                              HomeScreen.buildCategoryItemHistory(context,
                                  "assets/icons/Group 659.svg", 1, cubit),
                              const SizedBox(width: 10,),
                              HomeScreen.buildCategoryItemHistory(context,
                                  "assets/icons/Group 664.svg", 2, cubit),
                              const SizedBox(width: 10,),
                              HomeScreen.buildCategoryItemHistory(context,
                                  "assets/icons/Group 1310.svg", 3, cubit),
                              const SizedBox(width: 5,),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return HomeScreen.buildItemHistory();
                            },
                            itemCount: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
