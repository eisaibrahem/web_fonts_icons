import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';
import 'package:portfolio/screens/home_screen/cubit/home_state.dart';
import 'package:portfolio/shared/components.dart';
import '../screens/home_screen/cubit/home_cubit.dart';
import '../screens/saved_screen/saved_screen.dart';
import 'custom_buttons/app_bar_button.dart';
import '../shared/styles/themes.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Container(
          color: Colors.white,
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 15.75, left: 25.65, bottom: 11.8, right: 17.6),
                      child: SvgPicture.asset(
                        "assets/icons/Group 1028.svg",
                      ),
                    ),
                    Text('Site name',
                        style: TextStyle(
                          fontFamily: 'Berlin Sans FB',
                          fontSize: size.width * 0.020,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              buildSearchBar(context, size, cubit),
              const SizedBox(
                width: 10,
              ),
              MyCustomButton(
                  fontFamily: 'Arial Rounded MT',
                  paddingVertical: 5,
                  paddingHorizontal: 10,
                  textSize:  size.width*0.015  ,
                  height: size.width*0.035,
                  text: 'Saved',
                  assetSVG: "assets/icons/heart-svgrepo-com.svg",
                  onTap: () {
                     navigateTo(context, SavedScreen());
                  }),
              const SizedBox(
                width: 10,
              ),
              MyCustomButton(
                  paddingVertical: 5,
                  paddingHorizontal: 10,
                  fontFamily: 'Arial Rounded MT',
                  textSize: size.width*0.015  ,
                  height: size.width*0.035,
                  text: 'Contact US',
                  assetSVG: "assets/icons/message-svgrepo-com.svg",
                  onTap: () {}),
            ],
          ),
        );
      },
    );
  }

  Widget buildSearchBar(BuildContext context, Size size, HomeCubit cubit) {
    return Container(
      width: size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor,
      ),
      child: TextField(
        textAlign: TextAlign.start,
        controller: cubit.textSearchController,
        onChanged: (value) {
          cubit.searchForCategory(value);
        },
        style: const TextStyle(fontSize: 18, color: Colors.black),
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          hintText: 'search',
          hintTextDirection: TextDirection.ltr,
          hintStyle: TextStyle(
            fontSize: 16,
            color: kTextColor,
          ),
          alignLabelWithHint: true,
          suffixIcon: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    cubit.clearTextsearch();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.clear,
                      color: cubit.textSearchController.text == ''
                          ? Colors.transparent
                          : Colors.black87,
                      size: 25,
                    ),
                  ),
                ),
                Container(
                  width: 0.5,
                  height: 30,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.search,
                    color: kHoverColor,
                    size: 26,
                  ),
                )
              ],
            ),
          ),
          prefixIcon: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            height: 40,
            width: 150,
            margin: const EdgeInsets.only(right: 10,bottom: 3,top: 3,left: 3),
            padding: const EdgeInsets.only(right:20,left: 10,),
            child: DropdownButton<String>(
              elevation: 0,
              borderRadius: BorderRadius.circular(5),
              underline: Container(
                height: 1,
                color: Theme.of(context).primaryColor.withOpacity(.1),
              ),
              icon: Icon(Icons.keyboard_arrow_down_outlined,
                  color: kTextColor, size: 26),
              isExpanded: true,
              iconEnabledColor: Theme.of(context).primaryColor,
              iconSize: size.width * 0.030,
              dropdownColor: Colors.white,
              alignment: Alignment.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
              value: cubit.categoryValue,
              items: [
                DropdownMenuItem(
                    onTap: () {},
                    value: 'fonts',
                    child: Text(
                      'Fonts',
                      style: TextStyle(
                        fontFamily: 'Arial Rounded MT',
                        color: HexColor('#404456'),
                        fontSize: 18,
                      ),
                    )),
                DropdownMenuItem(
                    onTap: () {},
                    value: 'icons',
                    child: Text(
                      'Icons',
                      style: TextStyle(
                        fontFamily: 'Arial Rounded MT',
                        color: HexColor('#404456'),
                        fontSize: 18,
                      ),
                    )),
                DropdownMenuItem(
                    onTap: () {},
                    value: 'colors',
                    child: Text(
                      'Colors',
                      style: TextStyle(
                        fontFamily: 'Arial Rounded MT',
                        color: HexColor('#404456'),
                        fontSize: 18,
                      ),
                    )),
                DropdownMenuItem(
                    onTap: () {},
                    value: 'gradients',
                    child: Text(
                      'Gradients',
                      style: TextStyle(
                        fontFamily: 'Arial Rounded MT',
                        color: HexColor('#404456'),
                        fontSize: 18,
                      ),
                    )),
              ],
              onChanged: (String? newValue) {
                cubit.changeSearchCategoryValue(newValue);
              },
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
}
