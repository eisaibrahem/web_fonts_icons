import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';
import 'package:portfolio/custom_widgets/custom_buttons/save_button.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/screens/icons_screen/cubit/icons_cubit.dart';
import 'package:portfolio/screens/icons_screen/cubit/icons_state.dart';
import 'package:portfolio/shared/components.dart';
import 'package:portfolio/shared/styles/themes.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_buttons/my_custom_category_item.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/nav_bar_category.dart';
import '../../models/icons_model.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../../shared/network/remote/end_points.dart';
import '../quick_view_screen/quick_view_screen.dart';
import 'icons_details_screen.dart';
import 'package:http/http.dart' as http;

class IconsScreen extends StatelessWidget {
   IconsScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     IconsCubit cubit = IconsCubit.get(context);
     Size size = MediaQuery.of(context).size;
     return BlocConsumer<IconsCubit, IconsStates>(
       listener: (context, state) {},
       builder: (context, state) {
         return Scaffold(
           backgroundColor: kPrimaryColor,
           appBar: PreferredSize(
             preferredSize: Size(size.width,65),
             child: CustomAppBar(),
           ),
           body: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               const NavBarCategory(),
               Expanded(
                 child: ListView(
                   controller: cubit.scrollController,
                   children: [
                     Container(
                       width: size.width,
                       height: 110,
                       padding: const EdgeInsets.all(10),
                       margin: const EdgeInsets.all(5),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(3),
                         color: Colors.white,
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Category',
                             style: TextStyle(
                                 fontFamily: 'Leelawadee UI',
                                 color: HexColor('404456'),
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold),
                           ),
                           const SizedBox(
                             height: 10,
                           ),
                           Row(
                             children: List.generate(
                               13,
                                   (index) => MyCustomCategoryItem(
                                 onTap: () {},
                                 text: 'Animal',
                                 textSize: 18,
                                 fontWeight: FontWeight.normal,
                                 fontFamily:'Lato',
                               ),
                             ),
                           ),
                           Row(
                             children: List.generate(
                               8,
                                   (index) => MyCustomCategoryItem(
                                 onTap: () {},
                                 text: 'Social',
                                 textSize: 18,
                                 fontWeight: FontWeight.normal,
                                 fontFamily:'Lato',
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                     Container(
                       margin: const EdgeInsets.only(
                         right: 5,
                         left: 5,
                       ),
                       padding: const EdgeInsets.all(10),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(3), color: Colors.white),
                       child: Row(
                         children: [
                           MyCustomCategoryItem(
                             text: 'MonoColor',
                             color: kPrimaryColor,
                             textSize: 16,
                             height: 35,
                             width: 100,
                             paddingHorizontal: 1,
                             colorHover: HexColor('EBEDF2'),
                           ),
                           MyCustomCategoryItem(
                             text: 'MultiColor',
                             color: kPrimaryColor,
                             textSize: 16,
                             height: 35,
                             width: 100,
                             paddingHorizontal: 1,
                             colorHover:HexColor('EBEDF2') ,
                           ),
                           MyCustomCategoryItem(
                             text: "OutLined",
                             color: kPrimaryColor,
                             textSize: 16,
                             height: 35,
                             width: 85,
                             paddingHorizontal: 1,
                             colorHover:HexColor('EBEDF2') ,
                           ),
                           MyCustomCategoryItem(
                             text: "Filled",
                             color: kPrimaryColor,
                             textSize: 16,
                             height: 35,
                             width: 85,
                             paddingHorizontal: 1,
                             colorHover:HexColor('EBEDF2') ,
                           ),
                           const Spacer(),
                           Container(
                             height: 40,
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 10, vertical: 10),
                             width: size.width * 0.1,
                             decoration: BoxDecoration(
                                 color: kPrimaryColor,
                                 borderRadius: BorderRadius.circular(1)),
                             child: DropdownButton<String>(
                               elevation: 0,
                               borderRadius: BorderRadius.circular(5),
                               underline: Container(
                                 height: 1,
                                 color: Theme.of(context).primaryColor.withOpacity(.1),
                               ),
                               isExpanded: true,
                               icon: const Icon(Icons.keyboard_arrow_down_rounded),
                               iconEnabledColor: HexColor('#404456'),
                               iconSize: 22,
                               dropdownColor: Colors.white,
                               alignment: Alignment.center,
                               style: TextStyle(
                                   color: HexColor('#404456'),
                                   fontFamily: 'Arial Rounded MT',
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold,
                                   height: 1),
                               value: cubit.popularValue,
                               items: [
                                 DropdownMenuItem(
                                     onTap: () {},
                                     value: 'Popular',
                                     child: const Text('Popular')),
                                 DropdownMenuItem(
                                     onTap: () {},
                                     value: 'Trending',
                                     child: const Text('Trending')),
                                 DropdownMenuItem(
                                     onTap: () {},
                                     value: 'Featured',
                                     child: const Text('Featured')),
                               ],
                               onChanged: (String? newValue) {
                                 cubit.changePopularValue(newValue);
                               },
                             ),
                           )
                         ],
                       ),
                     ),
                     Container(
                       constraints: const BoxConstraints(
                         minHeight: 380
                       ),
                       padding: const EdgeInsets.all(10),
                       margin: const EdgeInsets.all(5),
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(3)),
                       child: GridView.count(
                         physics: const NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         crossAxisCount: 5,
                         crossAxisSpacing: 5.0,
                         mainAxisSpacing: 5.0,
                         scrollDirection: Axis.vertical,
                         children: List.generate(cubit.listOfSVGIcons.length, (index) {
                           return checkSVG(cubit.listOfSVGIcons[index])?
                           Container(
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
                                   onTap:(){
                                     navigateTo(context, IconsDetailsScreen(link:cubit.listOfSVGIcons[index]));
                                   },
                                   child:  Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child:ColorFiltered(
                                       //modulate
                                       colorFilter:ColorFilter.mode(Colors.white, BlendMode.modulate) ,
                                       child: SvgPicture.string(
                                         cubit.listOfSVGIcons[index],
                                         placeholderBuilder: (BuildContext context)
                                         => const Center(
                                             child: CircularProgressIndicator(color: Colors.grey,)
                                         ),
                                         height: 80,
                                         width: 80,
                                         color: cubit.testColor,
                                       ),
                                     ),
                                   ),
                                 ),
                                 const Spacer(),
                                 Container(
                                   padding: const EdgeInsets.symmetric(
                                       horizontal: 5, vertical: 5),
                                   height: 45,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       SaveButton(
                                         color: Colors.white,
                                         borderRadius: 2,
                                         height: 40,
                                         width: 55,
                                       ),
                                       MyCustomButton(
                                         onTap: (){
                                           showQuickScreen(
                                               context:context,
                                               isIconsScreen:true,
                                               isPalettesScreen: false,
                                               isGradientScreen: false,
                                               link:cubit.listOfSVGIcons[index]);
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
                                         onTap: ()async{
                                           await launchUrl(
                                             Uri.parse(cubit.listOfLinks[index]),
                                           );
                                         },
                                       ),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ):
                           Container();


                         }),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 6),
                       child: LinearProgressIndicator(color: Colors.grey[300],backgroundColor: Colors.grey),
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

   bool checkSVG(String svgString){
     final SvgParser parser = SvgParser();
     try {
       parser.parse(svgString, warningsAsErrors: true);
       return true;
     } catch (e) {
       print(e);
       return false;
     }
   }
}


