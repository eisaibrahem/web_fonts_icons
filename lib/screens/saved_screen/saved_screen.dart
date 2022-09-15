import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/custom_widgets/list_view_of_fonts.dart';

import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_buttons/my_custom_button.dart';
import '../../custom_widgets/custom_buttons/save_button.dart';
import '../../custom_widgets/item_gragient_colors.dart';
import '../../custom_widgets/item_palette.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/table_of_category.dart';
import '../../shared/components.dart';
import '../../shared/styles/themes.dart';
import '../fonts_screen/fonts_screen.dart';
import '../icons_screen/icons_details_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();

}

class _SavedScreenState extends State<SavedScreen> {
  final ScrollController _scrollController =ScrollController();
  String? popularValue ='Popular';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.width * 0.050),
        child: CustomAppBar(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TableOfCategory(),
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                SizedBox(
                  height: 100,
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 0.5,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text(
                            'Saved',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 20,
                              fontFamily: 'Arial Rounded MT',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            MyCustomButton(
                              onTap: () {
                                setState(() {
                                  selectGradientCategoryNumber(0);
                                });
                              },
                              text: 'Fonts',
                              textSize: 20,
                              height: 35,
                              width: 100,
                              color:
                                 selectedGradientCategoryNumbersList[0]
                                      ? Colors.blue[50]
                                      : kPrimaryColor,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              marginHorizontal: 5,
                              borderRadius: 3,
                            ),
                            MyCustomButton(
                              onTap: () {
                                setState(() {
                                  selectGradientCategoryNumber(1);
                                });
                              },
                              text: 'Icons',
                              textSize: 20,
                              height: 35,
                              width: 100,
                              color:
                                 selectedGradientCategoryNumbersList[1]
                                      ? Colors.blue[50]
                                      : kPrimaryColor,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              marginHorizontal: 5,
                              borderRadius: 3,
                            ),
                            MyCustomButton(
                              onTap: () {
                                setState(() {
                                  selectGradientCategoryNumber(2);
                                });

                              },
                              text: 'Palettes',
                              textSize: 20,
                              height: 35,
                              width: 100,
                              color:
                                 selectedGradientCategoryNumbersList[2]
                                      ?Colors.blue[50]
                                      : kPrimaryColor,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              marginHorizontal: 5,
                              borderRadius: 3,
                            ),
                            MyCustomButton(
                              onTap: () {
                                setState(() {
                                  selectGradientCategoryNumber(3);
                                });
                              },
                              text: 'Gradients',
                              textSize: 20,
                              height: 35,
                              width: 100,
                              color:
                                 selectedGradientCategoryNumbersList[3]
                                      ? Colors.blue[50]
                                      : kPrimaryColor,
                              paddingVertical: 5,
                              paddingHorizontal: 5,
                              marginHorizontal: 5,
                              borderRadius: 3,
                            ),
                            const Spacer(),
                            Container(
                              height: 40,
                              padding:const EdgeInsets.only(left: 5) ,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 120,
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
                                value: popularValue,
                                items: [
                                  DropdownMenuItem(onTap: (){},value:'Popular',child:const Text('Popular')),
                                  DropdownMenuItem(onTap: (){},value:'Trending',child:const Text('Trending')),
                                  DropdownMenuItem(onTap: (){},value:'Featured',child:const Text('Featured')),
                                ],
                                onChanged:(String? newValue) {
                                  setState(() {
                                    popularValue=newValue;
                                  });

                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,)
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.white,
                  elevation: 0.5,
                  child:
                  selectedGradientCategoryNumbersList[0]?ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListViewOfFonts();
                    },
                    itemCount: 20,
                  ):
                  selectedGradientCategoryNumbersList[1]?GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
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
                              onTap:(){
                                navigateTo(context, IconsDetailsScreen());
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.sports_baseball,
                                  color: Colors.black,
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
                                      showQuickScreen(context:context,isIconsScreen:true,isPalettesScreen: false,isGradientScreen: false);
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
                  ):
                  selectedGradientCategoryNumbersList[2]? GridView.count(
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
                  ):
                  GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 1,
                    padding: const EdgeInsets.all(5),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    childAspectRatio: 1.025,
                    scrollDirection: Axis.vertical,
                    children: List.generate(60, (index){
                      return ItemGragientColors();
                    }
                    ),
                  )


                ),
              ],
            ),
          ),
          const TableAdsAndHistory(),
        ],
      ),
    );
  }


    List<bool> selectedGradientCategoryNumbersList = [true, false, false, false,false,false,false,false,false];
      void selectGradientCategoryNumber(int n) {
        for (int i = 0; i < 9; i++) {
          if (i == n) {
            selectedGradientCategoryNumbersList[i] = true;
          } else {
            selectedGradientCategoryNumbersList[i] = false;
          }
        }
      }








}
