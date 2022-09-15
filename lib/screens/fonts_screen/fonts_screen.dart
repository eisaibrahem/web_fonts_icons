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
import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_buttons/download_button.dart';
import '../../custom_widgets/custom_buttons/save_button.dart';
import '../../custom_widgets/list_view_of_fonts.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/table_of_category.dart';
import '../../shared/styles/themes.dart';
import '../quick_view_screen/quick_view_screen.dart';

class FontsScreen extends StatelessWidget {

  CustomPopupMenuController customPopupMenuController = CustomPopupMenuController();
 static TextEditingController hexTextInputController = TextEditingController();
  JustTheController justTheController = JustTheController();
 static final TextEditingController testFontController = TextEditingController();

  ScrollController scrollFontsCategoryController=ScrollController();
 
  String? popularValue ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<FontsCubit, FontsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FontsCubit.get(context);
        return Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: PreferredSize(
            preferredSize: Size(size.width, size.width*0.050),
            child: CustomAppBar(),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TableOfCategory(),
              Expanded(
                child: ListView(
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
                                        controller: scrollFontsCategoryController,
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
                                    InkWell(
                                      onTap: (){
                                        scrollFontsCategoryController.animateTo(500, duration: Duration(milliseconds: 500),curve: Curves.easeIn);
                                      },
                                      child: Container(
                                        width: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child:  Icon(Icons.arrow_forward_ios_rounded,size: 22,color: kTextColor,),
                                      ),
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
                          return ListViewOfFonts();
                        },
                        itemCount: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const TableAdsAndHistory(),
            ],
          ),
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


}


const String likeSVG='''<svg xmlns="http://www.w3.org/2000/svg" width="32.297" height="28.571" viewBox="0 0 32.297 28.571">
  <path id="Union_72" data-name="Union 72" d="M13.935,27.63,2.668,16A9.64,9.64,0,0,1,.93,5.208a9.383,9.383,0,0,1,2.4-3.127A8.653,8.653,0,0,1,9.021,0a9.635,9.635,0,0,1,6.874,2.954l.254.263.256-.264A9.647,9.647,0,0,1,23.28,0a8.651,8.651,0,0,1,5.688,2.08,9.4,9.4,0,0,1,2.4,3.128A9.635,9.635,0,0,1,29.624,16L18.358,27.63a3.068,3.068,0,0,1-4.423,0Z" fill="#e4115e"/>
  </svg>
  ''';
const String disLikeSVG='''<svg xmlns="http://www.w3.org/2000/svg" height="40" width="40"><path d="m24 41.95-2.05-1.85q-5.3-4.85-8.75-8.375-3.45-3.525-5.5-6.3T4.825 20.4Q4 18.15 4 15.85q0-4.5 3.025-7.525Q10.05 5.3 14.5 5.3q2.85 0 5.275 1.35Q22.2 8 24 10.55q2.1-2.7 4.45-3.975T33.5 5.3q4.45 0 7.475 3.025Q44 11.35 44 15.85q0 2.3-.825 4.55T40.3 25.425q-2.05 2.775-5.5 6.3T26.05 40.1ZM24 38q5.05-4.65 8.325-7.975 3.275-3.325 5.2-5.825 1.925-2.5 2.7-4.45.775-1.95.775-3.9 0-3.3-2.1-5.425T33.5 8.3q-2.55 0-4.75 1.575T25.2 14.3h-2.45q-1.3-2.8-3.5-4.4-2.2-1.6-4.75-1.6-3.3 0-5.4 2.125Q7 12.55 7 15.85q0 1.95.775 3.925.775 1.975 2.7 4.5Q12.4 26.8 15.7 30.1 19 33.4 24 38Zm0-14.85Z"/></svg>
''';
const String signDular='''<svg id="Group_767" data-name="Group 767" xmlns="http://www.w3.org/2000/svg" width="24.915" height="24.915" viewBox="0 0 24.915 24.915">
  <ellipse id="Ellipse_87" data-name="Ellipse 87" cx="12.457" cy="12.457" rx="12.457" ry="12.457" fill="#4285f4"/>
  <path id="dollar-svgrepo-com" d="M14.846,7.751h1.769c0-2.51-2.437-3.655-4.424-3.918V2H10.423V3.832C8.436,4.1,6,5.241,6,7.751c0,2.394,2.359,3.639,4.424,3.919v4.4c-1.281-.222-2.654-.906-2.654-2.123H6c0,2.291,2.145,3.644,4.424,3.925v1.826h1.769V17.863c1.986-.264,4.424-1.409,4.424-3.919s-2.437-3.655-4.424-3.918v-4.4c1.177.211,2.654.833,2.654,2.123Zm-7.078,0c0-1.291,1.477-1.912,2.654-2.123V9.873C9.21,9.649,7.768,8.987,7.768,7.751Zm7.078,6.193c0,1.291-1.477,1.912-2.654,2.123V11.82C13.369,12.032,14.846,12.653,14.846,13.944Z" transform="translate(0.645 1.322)" fill="#fff"/>
</svg>
''';

void showQuickScreen({required BuildContext context,required bool isIconsScreen,required bool isPalettesScreen,required bool isGradientScreen}) {
  showDialog(
    context: context,
    builder: (context) => Directionality(
      textDirection: TextDirection.ltr,
      child: AlertDialog(
        backgroundColor: Colors.grey[100],
        scrollable: true,
        //actionsPadding:EdgeInsets.zero ,
        contentPadding: const EdgeInsets.all(0),
        //insetPadding: EdgeInsets.zero,
        content:  QuickViewScreen(isIconsScreen:isIconsScreen,isPalettesScreen: isPalettesScreen,isGradientScreen:isGradientScreen),
      ),
    ),
  );
}