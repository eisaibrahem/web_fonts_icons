import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:portfolio/custom_widgets/gradient_icon.dart';
import 'package:portfolio/screens/home_screen/cubit/home_cubit.dart';
import 'package:portfolio/screens/home_screen/cubit/home_state.dart';
import 'package:portfolio/screens/icons_screen/cubit/icons_cubit.dart';
import 'package:portfolio/screens/icons_screen/cubit/icons_state.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_buttons/my_custom_button.dart';
import '../../custom_widgets/custom_buttons/save_button.dart';
import '../../custom_widgets/tool_bar_icons.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/table_of_category.dart';
import '../../shared/components.dart';
import '../../shared/styles/themes.dart';
import '../fonts_screen/fonts_screen.dart';
import '../palettes_screen/blocky_color.dart';

class IconsDetailsScreen extends StatelessWidget {
   IconsDetailsScreen({Key? key}) : super(key: key);
  final ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<IconsCubit, IconsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        IconsCubit cubit = IconsCubit.get(context);
        return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: PreferredSize(
              preferredSize: Size(size.width, size.width * 0.050),
              child: CustomAppBar(),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TableOfCategory(),
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      ToolBarIcons(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 300,
                              width: size.width,
                              padding: const EdgeInsets.all(0),
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: cubit.backGraundColor),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                    cubit.listOfTestIconColors.length>1? GradientIcon(
                                      icon: Icons.sports_baseball,
                                      size: 150,
                                      gradient: LinearGradient(
                                        colors: cubit.listOfTestIconColors,
                                        begin: Alignment(-1.0, cubit.angelGradient),
                                        end: Alignment(cubit.angelGradient, 1),
                                      ),
                                    )
                                        :
                                    Icon(
                                      Icons.sports_baseball,
                                      size: 150,
                                      color:cubit.listOfTestIconColors.length == 1
                                          ? cubit.listOfTestIconColors[0]
                                          : cubit.testColor,
                                    )
                                      ,
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: MyCustomButton(
                                              onTap: () {},
                                              borderRadius: 3,
                                              color: Colors.white,
                                              height: 40,
                                              width: 70,
                                              text: 'PDF',
                                              textSize: 17,
                                              paddingHorizontal: 8,
                                              paddingVertical: 2,
                                              marginVertical: 10,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          MyCustomButton(
                                            onTap: () {},
                                            borderRadius: 3,
                                            color: Colors.white,
                                            height: 40,
                                            width: 70,
                                            text: 'JPG',
                                            textSize: 17,
                                            paddingHorizontal: 8,
                                            paddingVertical: 2,
                                            marginVertical: 10,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          MyCustomButton(
                                            onTap: () {},
                                            borderRadius: 3,
                                            color: Colors.white,
                                            height: 40,
                                            width: 70,
                                            text: 'PNG',
                                            textSize: 17,
                                            paddingHorizontal: 8,
                                            paddingVertical: 2,
                                            marginVertical: 10,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          MyCustomButton(
                                            onTap: () {},
                                            borderRadius: 3,
                                            color: Colors.white,
                                            height: 40,
                                            width: 70,
                                            text: 'SVG',
                                            textSize: 17,
                                            paddingHorizontal: 8,
                                            paddingVertical: 2,
                                            marginVertical: 10,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                right: 10),
                                            child: SaveButton(
                                              color: Colors.white,
                                              width: 70,
                                              height: 40,
                                              borderRadius: 3,
                                              iconsSize: 32,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 290,
                                    width: 250,
                                    margin: const EdgeInsets.only(
                                        right: 8, top: 8, bottom: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: cubit.isGradientPicker
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0),
                                            width: 250,
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 270,
                                                  height: 40,
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: kPrimaryColor,
                                                  ),
                                                  child: const Text(
                                                    'Select Colors',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                MultipleChoiceBlockPicker(
                                                  onColorsChanged:
                                                      (List<Color> value) {
                                                    cubit
                                                        .changeTestIconGradient(
                                                            value);
                                                  },
                                                  pickerColors: cubit
                                                      .listOfTestIconColors,
                                                  availableColors: colors,
                                                  useInShowDialog: true,
                                                  layoutBuilder: (context,
                                                      colors,
                                                      PickerItem child) {
                                                    Orientation orientation =
                                                        MediaQuery.of(context)
                                                            .orientation;
                                                    return Container(
                                                      width: 260,
                                                      height: 190,
                                                      padding: const EdgeInsets.all(5),
                                                      margin:
                                                          const EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          color: kPrimaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3)),
                                                      child: GridView.count(
                                                        crossAxisCount: 5,
                                                        crossAxisSpacing: 3,
                                                        mainAxisSpacing: 3,
                                                        children: [
                                                          for (Color color
                                                              in colors)
                                                            child(color)
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  itemBuilder: (Color color,
                                                      bool isCurrentColor,
                                                      void Function()
                                                          changeColor) {
                                                    return Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        color: color,
                                                      ),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: InkWell(
                                                          onTap: changeColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          child:
                                                              AnimatedOpacity(
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        250),
                                                            opacity:
                                                                isCurrentColor
                                                                    ? 1
                                                                    : 0,
                                                            child: Icon(
                                                              Icons.done,
                                                              size: 16,
                                                              color:
                                                                  useWhiteForeground(
                                                                          color)
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Container(
                                                  height: 30,
                                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                                  padding: const EdgeInsets.only(left: 5),
                                                  decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.center ,
                                                    children: [
                                                      Text('0',style: TextStyle(
                                                        color: kTextColor,
                                                        fontSize: 14,
                                                      )),
                                                      SfSlider(
                                                        showDividers: false,
                                                        activeColor: Colors.blue[100],
                                                        inactiveColor: Colors.grey,
                                                        min: -2.0,
                                                        max: 2.0,
                                                        value: cubit.angelGradient,
                                                        interval: 20,
                                                        showTicks: false,
                                                        showLabels: false,
                                                        enableTooltip: false,
                                                        minorTicksPerInterval: 1,
                                                        onChanged: ( value){
                                                          cubit.changeAngelGradient(value);
                                                        },
                                                      ),
                                                      Text('360',style: TextStyle(
                                                        color: kTextColor,
                                                        fontSize: 14,
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Stack(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                height: 270,
                                                width: 270,
                                                child: ColorPicker(
                                                  pickerColor: cubit
                                                          .isBackGraundColor
                                                      ? cubit.backGraundColor
                                                      : cubit.testColor,
                                                  onColorChanged: (color) {
                                                    if (cubit
                                                        .isBackGraundColor) {
                                                      cubit
                                                          .changeBackGraundColor(
                                                              color);
                                                    } else {
                                                      cubit.changeTestIconColor(
                                                          color);
                                                    }
                                                  },
                                                  enableAlpha: false,
                                                  paletteType:
                                                      PaletteType.hsvWithHue,
                                                  portraitOnly: true,
                                                  //hexInputBar: true,
                                                  hexInputController: FontsScreen
                                                      .hexTextInputController,
                                                  showLabel: false,
                                                  labelTextStyle:
                                                      const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),

                                                  pickerAreaBorderRadius:
                                                      BorderRadius.circular(1),
                                                  pickerAreaHeightPercent: 0.65,
                                                  colorPickerWidth: 270,

                                                  displayThumbColor: true,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  margin: const EdgeInsets
                                                      .only(bottom: 10),
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      JustTheTooltip(
                                                        content: Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child:  const Text('Hide Background',
                                                            style: TextStyle(
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
                                                        waitDuration: const Duration(milliseconds: 200),
                                                        preferredDirection:AxisDirection.up ,
                                                        child: Container(
                                                          margin: const EdgeInsets.only(right: 5),
                                                          height:   30,
                                                           width: 30,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(3),
                                                            border: Border.all(
                                                              color: kTextColor,
                                                               width: 1
                                                            )
                                                          ),
                                                          child: Checkbox(
                                                            onChanged: (v){
                                                              cubit.changeCheckedDownload(v);
                                                            },
                                                            fillColor: MaterialStateProperty.all(Colors.grey),
                                                            checkColor: Colors.black,
                                                            value: cubit.isCheckedDownload,
                                                          ),
                                                        ),
                                                      ),

                                                      SizedBox(
                                                        width: 185,
                                                        child: TextField(
                                                          controller: FontsScreen
                                                              .hexTextInputController,
                                                          style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                          cursorColor: Colors.black,
                                                          autofocus: true,
                                                          enableSuggestions: true,
                                                          decoration: InputDecoration(
                                                            labelStyle:
                                                                const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 10  ,
                                                                    horizontal: 5),
                                                            suffixIcon: IconButton(
                                                              tooltip: 'copy',
                                                              hoverColor:
                                                                  Colors.transparent,
                                                              onPressed: () {
                                                                Clipboard.setData(
                                                                    ClipboardData(
                                                                        text: FontsScreen
                                                                            .hexTextInputController
                                                                            .text));
                                                              },
                                                              icon: const Icon(
                                                                Icons.paste_outlined,
                                                                color: Colors.black87,
                                                                size: 20,
                                                              ),
                                                            ),
                                                            prefixIcon: const Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      left: 8.0),
                                                              child: Icon(
                                                                Icons.tag,
                                                                color: Colors.black87,
                                                                size: 20,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                              color: kHoverColor,
                                                              width: 1,
                                                            )),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                              color: kHoverColor,
                                                              width: 1,
                                                            )),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                  ),
                                  Container(
                                    height: 290,
                                    width: 250,
                                    margin: const EdgeInsets.only(
                                        right: 8, top: 8, bottom: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: SliderTheme(
                                      data: const SliderThemeData(
                                        trackHeight: 5,
                                        thumbColor: Colors.white,
                                        rangeThumbShape:RoundRangeSliderThumbShape(
                                          elevation: 1,
                                          enabledThumbRadius: 1,
                                          disabledThumbRadius: 1,
                                          pressedElevation: 1,
                                        ),
                                        rangeTickMarkShape: RoundRangeSliderTickMarkShape(
                                          tickMarkRadius:8 ,
                                        ),
                                        inactiveTickMarkColor: Colors.grey,
                                        inactiveTrackColor: Colors.brown,


                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 220,
                                            child: SfSlider(
                                              showDividers: true,
                                              activeColor: Colors.blue[100],
                                              inactiveColor: Colors.grey,
                                              min: 0,
                                              max: 1,
                                              value: cubit.isBold,
                                              interval: 20,
                                              showTicks: false,
                                              showLabels: false,
                                              enableTooltip: false,
                                              minorTicksPerInterval: 1,
                                              onChanged: ( value){
                                                cubit.changeWightIcon(value);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 5),
                              child: Text(
                                'Explore Another Icons',
                                style: TextStyle(
                                    color: kTextColor,
                                    fontFamily: 'Arial Rounded MT',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 5,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          scrollDirection: Axis.vertical,
                          children: List.generate(30, (index) {
                            return Container(
                              height: 200,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: kPrimaryColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      navigateTo(
                                          context, IconsDetailsScreen());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.sports_baseball,
                                        color: cubit.testColor,
                                        size: 100,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    height: 45,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SaveButton(
                                          color: Colors.white,
                                          borderRadius: 2,
                                          height: 40,
                                          width: 55,
                                        ),
                                        MyCustomButton(
                                          onTap: () {
                                            showQuickScreen(
                                                context: context,
                                                isIconsScreen: true,
                                                isPalettesScreen: false,
                                                isGradientScreen: false);
                                          },
                                          icon: Icons.remove_red_eye_outlined,
                                          iconSize: 26,
                                          color: Colors.white,
                                          borderRadius: 2,
                                          toolTip: 'Quick View',
                                          height: 40,
                                          width: 55,
                                        ),
                                        MyCustomButton(
                                          icon: Icons.download,
                                          toolTip: 'Download SVG',
                                          iconSize: 26,
                                          color: Colors.white,
                                          borderRadius: 2,
                                          height: 40,
                                          width: 55,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                const TableAdsAndHistory(),
              ],
            ));
      },
    );
  }
}