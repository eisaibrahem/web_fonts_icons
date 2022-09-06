import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';
import 'package:portfolio/custom_widgets/tool_bar_fonts.dart';
import 'package:portfolio/screens/fonts_screen/font_details_screen.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_cubit.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_states.dart';
import 'package:portfolio/shared/components.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../custom_widgets/custom_buttons/download_button.dart';
import '../../custom_widgets/custom_buttons/save_button.dart';
import '../../shared/styles/themes.dart';
import '../quick_view_screen/quick_view_screen.dart';

class FontsScreen extends StatelessWidget {

  CustomPopupMenuController customPopupMenuController = CustomPopupMenuController();
 static TextEditingController hexTextInputController = TextEditingController();
  JustTheController justTheController = JustTheController();
 static TextEditingController testFontController = TextEditingController();

  String? popularValue ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<FontsCubit, FontsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FontsCubit.get(context);
        return ListView(
          controller: ScrollController(),
          shrinkWrap: true,
          children: [
            Card(
              margin: const EdgeInsets.all(6),
              color: Colors.white,
              elevation: 0.5,
              child: SizedBox(
                width: size.width,
                height: 350,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(26, (index) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Text(
                                  cubit.alphabets[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 20,
                                      height: 1.1,
                                      color: kTextColor),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(bottom: 5, right: 5, left: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  myTable(
                                    children: [
                                      buildTitleOfTableCategory(
                                        title: 'Top Fonts',
                                      ),
                                      buildTableOfCategory(
                                        count: 10,
                                      ),
                                    ],
                                  ),
                                  myTable(
                                    children: [
                                      buildTitleOfTableCategory(
                                        title: 'Top Fonts',
                                      ),
                                      buildTableOfCategory(
                                        count: 10,
                                      ),
                                    ],
                                  ),
                                  myTable(
                                    children: [
                                      buildTitleOfTableCategory(
                                        title: 'Top Fonts',
                                      ),
                                      buildTableOfCategory(
                                        count: 10,
                                      ),
                                    ],
                                  ),
                                  myTable(
                                    children: [
                                      buildTitleOfTableCategory(
                                        title: 'Top Fonts',
                                      ),
                                      buildTableOfCategory(
                                        count: 5,
                                      ),
                                      buildTitleOfTableCategory(
                                        title: 'TV',
                                      ),
                                      buildTableOfCategory(
                                        count: 4,
                                      ),
                                    ],
                                  ),
                                  myTable(
                                    children: [
                                      buildTitleOfTableCategory(
                                        title: 'SVG',
                                      ),
                                      buildTableOfCategory(
                                        count: 3,
                                      ),
                                      buildTitleOfTableCategory(
                                        title: 'Games',
                                      ),
                                      buildTableOfCategory(
                                        count: 2,
                                      ),
                                      buildTitleOfTableCategory(
                                        title: 'Animal',
                                      ),
                                      buildTableOfCategory(
                                        count: 3,
                                      ),
                                    ],
                                  ),
                                  myTable(
                                    children: [
                                      buildTitleOfTableCategory(
                                        title: 'Top Fonts',
                                      ),
                                      buildTableOfCategory(
                                        count: 10,
                                      ),
                                    ],
                                  ),
                                  myTable(
                                    children: [
                                      buildTitleOfTableCategory(
                                        title: 'Top Fonts',
                                      ),
                                      buildTableOfCategory(
                                        count: 5,
                                      ),
                                      buildTitleOfTableCategory(
                                        title: 'TV',
                                      ),
                                      buildTableOfCategory(
                                        count: 4,
                                      ),
                                    ],
                                  ),
                                  myTable(
                                    children: [
                                      buildTitleOfTableCategory(
                                        title: 'SVG',
                                      ),
                                      buildTableOfCategory(
                                        count: 3,
                                      ),
                                      buildTitleOfTableCategory(
                                        title: 'Games',
                                      ),
                                      buildTableOfCategory(
                                        count: 2,
                                      ),
                                      buildTitleOfTableCategory(
                                        title: 'Animal',
                                      ),
                                      buildTableOfCategory(
                                        count: 3,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 30,
                              alignment: Alignment.center,

                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child:  Icon(Icons.arrow_forward_ios_rounded,size: 22,color: kTextColor,),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ToolBarDetailsScreen(isBackGround:false),
            Card(
              margin: const EdgeInsets.all(6),
              color: Colors.white,
              elevation: 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildItemOfListView(size,cubit,context);
                },
                itemCount: 20,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildTableOfCategory({required int count}) {
    return Column(
      children: List.generate(count, (index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          child: Text(
            'Top 100',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              color: kTextColor,
            ),
          ),
        );
      }),
    );
  }

  Widget buildTitleOfTableCategory({required String title}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Arial Rounded MT',
          color: kTextColor,
        ),
      ),
    );
  }

  Widget myTable({required List<Widget> children}) {
    return Container(
      width: 151,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(3)),
      child: Column(
        children: children,
      ),
    );
  }




  static Widget buildItemOfListView(Size size,FontsCubit cubit,BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 6, left: 6, top: 6),
      color: kPrimaryColor,
      elevation: 0,

      child: GestureDetector(
        onTap: (){
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
                            ? testFontController.text
                            : 'Write any Word ',
                        style: TextStyle(
                          fontSize: 5 * cubit.fontSizeValueTest,
                        ),
                        colors: cubit.listOfTestTextColors,
                      )
                          : Text(
                        (cubit.testText != '')
                            ? testFontController.text
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyCustomButton(
                          onTap: () {},
                          text: 'Download',
                          fontFamily: 'Arial Rounded MT',
                          color: Colors.white,
                          borderRadius: 5,
                          elevation: 1,
                          iconSize: 26,
                          height: 40,
                          textSize: 25,
                          icon: Icons.download,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            SaveButton(
                              color: Colors.white,
                              elevation:1,
                            ),
                            MyCustomButton(
                              onTap: () {
                                showQuickScreen(context:context,isIconsScreen: false);
                              },
                              icon: Icons.remove_red_eye_outlined,
                              iconSize: 26,
                              color: Colors.white,
                              paddingVertical: 1,
                              borderRadius: 1,
                              elevation: 1,
                              height: 30,
                              width: 50,
                              toolTip: 'Quick View',
                            ),
                            MyCustomButton(
                              onTap: () {},
                              elevation: 1,
                              text: 'SVG',
                               textSize: 17,
                              height: 30,
                              width: 50,
                              fontFamily: 'Arial Rounded MT',
                              color: Colors.white,
                              borderRadius: 1,
                              toolTip: 'Download SVG',
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Text('22485  Downloads',
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                            fontSize: 18,
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
  }

}

const String likeSVG='''<svg xmlns="http://www.w3.org/2000/svg" width="32.297" height="28.571" viewBox="0 0 32.297 28.571">
  <path id="Union_72" data-name="Union 72" d="M13.935,27.63,2.668,16A9.64,9.64,0,0,1,.93,5.208a9.383,9.383,0,0,1,2.4-3.127A8.653,8.653,0,0,1,9.021,0a9.635,9.635,0,0,1,6.874,2.954l.254.263.256-.264A9.647,9.647,0,0,1,23.28,0a8.651,8.651,0,0,1,5.688,2.08,9.4,9.4,0,0,1,2.4,3.128A9.635,9.635,0,0,1,29.624,16L18.358,27.63a3.068,3.068,0,0,1-4.423,0Z" fill="#e4115e"/>
  </svg>
  ''';
const String disLikeSVG='''<svg xmlns="http://www.w3.org/2000/svg" width="32.297" height="28.571" viewBox="0 0 32.297 28.571">
  <path id="Icon_awesome-heart" data-name="Icon awesome-heart" d="M7.519.748A9.635,9.635,0,0,1,14.394,3.7l.254.262L14.9,3.7A9.648,9.648,0,0,1,21.779.748a8.652,8.652,0,0,1,5.687,2.08,9.392,9.392,0,0,1,2.4,3.128,9.634,9.634,0,0,1-1.744,10.788L16.857,28.377a3.068,3.068,0,0,1-4.422,0L1.167,16.743A9.64,9.64,0,0,1-.571,5.955a9.392,9.392,0,0,1,2.4-3.126A8.655,8.655,0,0,1,7.519.748Zm7.129,6.783-2.039-2.1a7.14,7.14,0,0,0-5.091-2.2A6.2,6.2,0,0,0,3.442,4.719,6.981,6.981,0,0,0,.992,9.75a7.1,7.1,0,0,0,1.961,5.265L14.219,26.649a.583.583,0,0,0,.853,0L26.339,15.015A7.1,7.1,0,0,0,28.3,9.751a6.977,6.977,0,0,0-2.45-5.032,6.2,6.2,0,0,0-4.075-1.486,7.152,7.152,0,0,0-5.092,2.2Z" transform="translate(1.501 -0.748)" fill="#8b90ac"/>
</svg>
''';
const String signDular='''<svg id="Group_767" data-name="Group 767" xmlns="http://www.w3.org/2000/svg" width="24.915" height="24.915" viewBox="0 0 24.915 24.915">
  <ellipse id="Ellipse_87" data-name="Ellipse 87" cx="12.457" cy="12.457" rx="12.457" ry="12.457" fill="#4285f4"/>
  <path id="dollar-svgrepo-com" d="M14.846,7.751h1.769c0-2.51-2.437-3.655-4.424-3.918V2H10.423V3.832C8.436,4.1,6,5.241,6,7.751c0,2.394,2.359,3.639,4.424,3.919v4.4c-1.281-.222-2.654-.906-2.654-2.123H6c0,2.291,2.145,3.644,4.424,3.925v1.826h1.769V17.863c1.986-.264,4.424-1.409,4.424-3.919s-2.437-3.655-4.424-3.918v-4.4c1.177.211,2.654.833,2.654,2.123Zm-7.078,0c0-1.291,1.477-1.912,2.654-2.123V9.873C9.21,9.649,7.768,8.987,7.768,7.751Zm7.078,6.193c0,1.291-1.477,1.912-2.654,2.123V11.82C13.369,12.032,14.846,12.653,14.846,13.944Z" transform="translate(0.645 1.322)" fill="#fff"/>
</svg>
''';

void showQuickScreen({BuildContext? context, bool ?isIconsScreen}) {
  showDialog(
    context: context!,
    builder: (context) => Directionality(
      textDirection: TextDirection.ltr,
      child: AlertDialog(
        backgroundColor: Colors.grey[100],
        scrollable: true,
        //actionsPadding:EdgeInsets.zero ,
        contentPadding: const EdgeInsets.all(0),
        //insetPadding: EdgeInsets.zero,
        content:  QuickViewScreen(isIconsScreen:isIconsScreen!),
      ),
    ),
  );
}