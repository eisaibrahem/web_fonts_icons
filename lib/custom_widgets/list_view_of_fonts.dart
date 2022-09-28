import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_cubit.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_states.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../screens/fonts_screen/font_details_screen.dart';
import '../screens/fonts_screen/fonts_screen.dart';
import '../screens/quick_view_screen/quick_view_screen.dart';
import '../shared/components.dart';
import '../shared/styles/themes.dart';
import 'custom_buttons/my_custom_button.dart';
import 'custom_buttons/save_button.dart';

class ListViewOfFonts extends StatefulWidget {
  const ListViewOfFonts({Key? key}) : super(key: key);


  @override
  State<ListViewOfFonts> createState() => _ListViewOfFontsState();
}

class _ListViewOfFontsState extends State<ListViewOfFonts> {

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return BlocConsumer<FontsCubit,FontsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        FontsCubit cubit =FontsCubit.get(context);
        return Card(
          margin: const EdgeInsets.only(right: 6, left: 6, top: 6),
          color: kPrimaryColor,
          elevation: 0,

          child: GestureDetector(
            onTap: (){
              // Navigator.push(
              //   context,
              //   PageTransition(
              //       type: PageTransitionType.fade,
              //       alignment: Alignment.center,
              //       child : FontDetailsScreen(),
              //       duration: const Duration(milliseconds: 300)
              //   ),
              // );
              navigateTo(context, FontDetailsScreen());
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              width: size.width,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'By : Mark Goldbridge',
                        style: TextStyle(
                          fontFamily: 'Microsoft Tai Le',
                          fontSize: 16,
                          color: kTextColor,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          SvgPicture.string(
                            signDular,
                            height: 17,
                            width: 17,
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            'Public Domain',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height:130 ,
                        constraints:BoxConstraints(
                          maxWidth: size.width*0.50,
                          minWidth: size.width*.1,
                        ),
                        child:(cubit.listOfTestTextColors.length > 1)
                            ? GradientText(
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
                              ?FontsScreen.testFontController.text
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
                      SizedBox(
                        width: 170,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Material(
                              elevation: 0.5,
                              borderRadius: BorderRadius.circular(5),
                              child: MyCustomButton(
                                onTap: () {},
                                text: 'Download',
                                fontFamily: 'Arial Rounded MT',
                                color: Colors.white,
                                borderRadius: 5,
                                iconSize: 26,
                                height: 40,
                                textSize: 25,
                                icon: Icons.download,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                SaveButton(
                                  elevation: 0.5,
                                  color: Colors.white,
                                  borderRadius: 5,
                                  width: 53,
                                ),
                                Material(
                                  elevation: 0.5,
                                  borderRadius: BorderRadius.circular(5),
                                  child: MyCustomButton(
                                    onTap: () {
                                      showQuickScreen(context:context,isIconsScreen: false,isPalettesScreen: false,isGradientScreen: false);
                                    },
                                    icon: Icons.remove_red_eye_outlined,
                                    iconSize: 26,
                                    color: Colors.white,
                                    paddingVertical: 1,
                                    borderRadius: 5,
                                    height: 30,
                                    width: 53,
                                    toolTip: 'Quick View',
                                  ),
                                ),
                                Material(
                                  elevation: 0.5,
                                  borderRadius: BorderRadius.circular(5),
                                  child: MyCustomButton(
                                    onTap: () {},
                                    text: 'SVG',
                                    textSize: 17,
                                    height: 30,
                                    width: 53,
                                    fontFamily: 'Arial Rounded MT',
                                    color: Colors.white,
                                    borderRadius: 5,
                                    toolTip: 'Download SVG',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Text('22485  Downloads',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
