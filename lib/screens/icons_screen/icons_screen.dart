import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';
import 'package:portfolio/custom_widgets/custom_buttons/save_button.dart';
import 'package:portfolio/custom_widgets/my_custom_pupup_item.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/screens/icons_screen/cubit/icons_cubit.dart';
import 'package:portfolio/screens/icons_screen/cubit/icons_state.dart';
import 'package:portfolio/shared/styles/themes.dart';

import '../../custom_widgets/custom_buttons/my_custom_icon_category_item.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconsCubit cubit = IconsCubit.get(context);
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<IconsCubit, IconsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView(
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
                      (index) => MyCustomIconCategoryItem(
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
                      (index) => MyCustomIconCategoryItem(
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
                  MyCustomIconCategoryItem(
                    text: 'MonoColor',
                    color: kPrimaryColor,
                    textSize: 16,
                    height: 35,
                    width: 100,
                    paddingHorizontal: 1,
                    colorHover: HexColor('EBEDF2'),
                  ),
                  MyCustomIconCategoryItem(
                      text: 'MultiColor',
                      color: kPrimaryColor,
                      textSize: 16,
                      height: 35,
                      width: 100,
                    paddingHorizontal: 1,
                    colorHover:HexColor('EBEDF2') ,
                  ),
                  MyCustomIconCategoryItem(
                      text: "OutLined",
                      color: kPrimaryColor,
                      textSize: 16,
                      height: 35,
                      width: 85,
                    paddingHorizontal: 1,
                    colorHover:HexColor('EBEDF2') ,
                  ),
                  MyCustomIconCategoryItem(
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
                      underline: Container(
                        height: 1,
                        color: Theme.of(context).primaryColor.withOpacity(.1),
                      ),
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      iconEnabledColor: HexColor('#404456'),
                      iconSize: 22,
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(5),
                width: size.width,
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
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.sports_baseball,
                              color: Colors.black,
                              size: 100,
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
                                    showQuickScreen(context:context,isIconsScreen:true);
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
              ),
            )
          ],
        );
      },
    );
  }
}
