import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/screens/gradients_screen/cubit/gradient_state.dart';
import 'package:portfolio/shared/styles/themes.dart';

import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_buttons/my_custom_button.dart';
import '../../custom_widgets/item_gragient_colors.dart';

import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/nav_bar_category.dart';
import '../palettes_screen/blocky_color.dart';
import 'cubit/gradient_cubit.dart';

class GradientsScreen extends StatelessWidget {
   GradientsScreen({Key? key}) : super(key: key);
   final ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradientCubit,GradientStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        GradientCubit cubit =GradientCubit.get(context);
        Size size =MediaQuery.of(context).size;
      return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: PreferredSize(
          preferredSize: Size(size.width,65),
          child: CustomAppBar(),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const NavBarCategory(index:3),
            Expanded(
              child: ListView(
                controller: _scrollController,
                children: [
                  Container(
                    height:120,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Colors',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                         SizedBox(height: 10),
                        MultipleChoiceBlockPicker(
                          onColorsChanged: (List<Color> value) {
                            cubit.changeListOfPaletteColors(value);
                          },
                          pickerColors: cubit.listOfGradientColors,
                          availableColors: colors,
                          useInShowDialog: true,
                          layoutBuilder: ( context,  colors, PickerItem child) {
                            Orientation orientation = MediaQuery.of(context).orientation;
                            return Container(
                              width:size.width,
                              height:60,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3)
                              ),
                              child: GridView.count(
                                scrollDirection: Axis.horizontal,
                                crossAxisCount: 1,
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
                                      size: 20,
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
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 5,right: 5,bottom: 5,top: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(5, (index)
                          => MyCustomButton(
                            onTap: (){
                              cubit.selectGradientCategoryNumber(index);
                            },
                            text: '${index+2}',
                            textSize: 20,
                            height: 40,
                            width: 40,
                            color: cubit.selectedGradientCategoryNumbersList[index]?HexColor('CFEFE7'):kPrimaryColor,
                            paddingVertical: 5,
                            paddingHorizontal: 5,
                            marginHorizontal: 3,
                            borderRadius: 40,
                          )

                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 60,
                          padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10) ,
                          width: size.width*0.1,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius:BorderRadius.circular(1)
                          ),
                          child: DropdownButton<String>(
                            elevation: 0,
                            borderRadius: BorderRadius.circular(5),
                            underline: Container(
                              height: 1,
                              color: Theme.of(context).primaryColor.withOpacity(.1),
                            ),
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            iconEnabledColor:HexColor('#404456'),
                            iconSize:22,
                            dropdownColor: Colors.white,
                            alignment: Alignment.center,
                            style:  TextStyle(
                                color:HexColor('#404456') ,
                                fontFamily: 'Arial Rounded MT',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                height: 1
                            ) ,
                            value: cubit.popularValue,
                            items: [
                              DropdownMenuItem(onTap: (){},value:'Popular',child:const Text('Popular')),
                              DropdownMenuItem(onTap: (){},value:'Trending',child:const Text('Trending')),
                              DropdownMenuItem(onTap: (){},value:'Newest',child:const Text('Newest')),
                            ],
                            onChanged:(String? newValue) {
                              cubit.changePopularValue(newValue);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ItemsGragientGridView(),


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
}
