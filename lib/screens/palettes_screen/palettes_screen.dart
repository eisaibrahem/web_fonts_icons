import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';
import 'package:portfolio/shared/styles/themes.dart';

import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_buttons/my_custom_category_item.dart';
import '../../custom_widgets/item_palette.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/table_of_category.dart';
import 'blocky_color.dart';
import 'cubit/color_palettes_cubit.dart';
import 'cubit/color_palettes_state.dart';

class PalettesScreen extends StatelessWidget {
   PalettesScreen({Key? key}) : super(key: key);
  final ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<PalettesCubit,PalettesStates>(
       listener: (context, state) {

       },
      builder: (context, state) {
        PalettesCubit cubit=PalettesCubit.get(context);
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
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      height:cubit.isMore?290:130,
                      width:size.width,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 5,left: 5,top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                           Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Colors',
                              style: TextStyle(
                                color: HexColor('404456'),
                                fontSize:22 ,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          MultipleChoiceBlockPicker(
                            onColorsChanged: (List<Color> value) {
                              cubit.changeListOfPaletteColors(value);
                            },
                            pickerColors: cubit.listOfPaletteColors,
                            availableColors: colors,
                            useInShowDialog: true,
                            layoutBuilder: ( context,  colors, PickerItem child) {
                              Orientation orientation = MediaQuery.of(context).orientation;
                              return Container(
                                width:size.width,
                                height:65,
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
                                        size: 28,

                                        color: useWhiteForeground(color) ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } ,

                          ),
                          cubit.isMore?Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('Styles',
                                      style: TextStyle(
                                        color: HexColor('404456'),
                                        fontSize:22 ,
                                        fontWeight: FontWeight.bold,
                                       // fontFamily: 'Microsoft Tai Le',
                                      ),
                                    ),
                              ),
                                   Row(
                                    children: List.generate(
                                      8,
                                          (index) => MyCustomCategoryItem(
                                        onTap: () {},
                                        text: 'Gold',
                                        textSize: 20,
                                        fontWeight: FontWeight.normal,
                                        fontFamily:'Lato',
                                      ),
                                    ),
                              ),
                                   Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('Topics',
                                      style: TextStyle(
                                        color: HexColor('404456'),
                                        fontSize:22 ,
                                        fontWeight: FontWeight.bold,
                                        // fontFamily: 'Microsoft Tai Le',
                                      ),
                                    ),
                              ),
                                   Row(
                                    children: List.generate(
                                      13, (index) => MyCustomCategoryItem(
                                        onTap: () {},
                                        text: 'Food',
                                        textSize: 20,
                                        fontWeight: FontWeight.normal,
                                        fontFamily:'Lato',
                                      ),
                                    ),
                              ),
                                   Row(
                                    children: List.generate(
                                      8, (index) => MyCustomCategoryItem(
                                      width: 85,
                                        onTap: () {},
                                        text: 'Winter',
                                        textSize: 20,
                                        fontWeight: FontWeight.normal,
                                        fontFamily:'Lato',
                                      ),
                                    ),
                              ),
                                 ],
                               ),
                            ),
                          ):
                          Container(),
                        ],
                      ),
                    ),
                    cubit.isMore?Container(
                      height: 40,
                      margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3)
                      ),
                      child: InkWell(
                        onTap: (){
                          cubit.showMore();
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up_sharp,
                          size: 35,
                          color: Colors.grey,

                        ),
                      ),
                    ):
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: 40,
                      margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: InkWell(
                        onTap: (){
                          cubit.showMore();
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Other',
                                style: TextStyle(
                                  color: HexColor('404456'),
                                  fontSize:22 ,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 35,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 10,)
                          ],
                        ),
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
                            children: List.generate(9, (index)
                            => MyCustomButton(
                              onTap: (){
                                cubit.selectPalettes(index);
                              },
                              text: '${index+2}',
                              textSize: 20,
                              height: 40,
                              width: 40,
                              color: cubit.selectedPalettes[index]?HexColor('CFEFE7'):kPrimaryColor,
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
                    Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      child: GridView.count(
                        crossAxisSpacing: 12,
                        padding: const EdgeInsets.all(5),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 2.7,
                        primary:true ,
                        scrollDirection: Axis.vertical,
                        children: List.generate(60, (index){
                          return ItemColorsPalette();
                        }
                        ),
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
}
