import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_cubit.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';

import '../screens/icons_screen/cubit/icons_cubit.dart';
import '../screens/icons_screen/cubit/icons_state.dart';
import '../screens/palettes_screen/blocky_color.dart';
import '../shared/styles/themes.dart';


class ToolBarIcons extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<IconsCubit, IconsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        IconsCubit cubit=IconsCubit.get(context);
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 5),
          color: Colors.white,
          elevation: 0.5,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: size.width,
            height: 60,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),

               InkWell(
                  onTap: (){
                    cubit.changPaletToColorPalet();
                    cubit.useColorPecker();
                  },
                  child: SvgPicture.string(forGraundIcon,
                    height: 30,
                    width: 30,
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),
              InkWell(
                  onTap: (){
                  cubit.changPaletToColorPalet();
                  cubit.useBackGraundPalet();
                  },
                  child: SvgPicture.string(backGraundColor,
                    height: 30,
                    width: 30,
                  ),
                ),
                 const SizedBox(
                  width: 20,
                ),

               InkWell(
               onTap: (){
                 cubit.changPaletToGradientPalet();
               },
               child: SvgPicture.asset(
                   "assets/icons/gradient-svgrepo-com(1).svg",
                   width: 40),
             ),

                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  tooltip: 'Reset',
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    cubit.resetColorAndSizeIconTest();
                  },
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset("assets/icons/reset-logo.svg",
                      width: 40),
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
                      'By : Mark Goldbridge',
                      style: TextStyle(
                        fontFamily: 'Microsoft Tai Le',
                        fontSize: 16,
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


}

String backGraundColor='''<svg id="Group_748" data-name="Group 748" xmlns="http://www.w3.org/2000/svg" width="46.914" height="46.049" viewBox="0 0 46.914 46.049">
  <rect id="Rectangle_787" data-name="Rectangle 787" width="32.083" height="32.083" rx="2" fill="#4285f4"/>
  <g id="Group_746" data-name="Group 746" transform="translate(34.255 0.443)">
    <path id="Path_592" data-name="Path 592" d="M449.771,99.678l2.507-4.342h-5.013Z" transform="translate(-440.22 -87.619)" fill="#4285f4"/>
    <path id="Path_593" data-name="Path 593" d="M367.544,10.507l4.342,2.507V8Z" transform="translate(-367.544 -8)" fill="#4285f4"/>
  </g>
  <g id="Group_747" data-name="Group 747" transform="translate(14.511 13.647)">
    <rect id="Rectangle_788" data-name="Rectangle 788" width="32.402" height="32.402" rx="2" fill="#ff0c3e"/>
    <rect id="Rectangle_789" data-name="Rectangle 789" width="16.201" height="18.226" rx="1" transform="translate(8.101 7.088)" fill="#fff"/>
  </g>
</svg>

''';

String forGraundIcon='''<svg id="Group_794" data-name="Group 794" xmlns="http://www.w3.org/2000/svg" width="46.914" height="46.049" viewBox="0 0 46.914 46.049">
  <g id="Group_748" data-name="Group 748">
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
