import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';

import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_buttons/my_button_hover_text.dart';
import '../../custom_widgets/custom_tost.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/nav_bar_category.dart';
import '../../shared/styles/themes.dart';
import '../palettes_screen/blocky_color.dart';

class ColorsExtractorScreen extends StatefulWidget {
   ColorsExtractorScreen({Key? key}) : super(key: key);

  @override
  State<ColorsExtractorScreen> createState() => _ColorsExtractorScreenState();
}

class _ColorsExtractorScreenState extends State<ColorsExtractorScreen> {
  final toast=FToast();
  final ScrollController _scrollController =ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toast.init(context);
  }

  void showBottomToast(){
    toast.showToast(
        child: MyCustomToast(),
        positionedToastBuilder: (context,child){
          return Positioned(child: child, bottom: 10,left: 510,);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
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
          const NavBarCategory(),
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(6),
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Text('Color Extractor',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 22,
                        fontFamily: 'Arial Rounded MT',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 380,
                        height: 300,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: kPrimaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             Icon(
                              Icons.file_download_outlined,
                              size: 60,
                              color: kTextColor,
                            ),
                            Text('Drop Your Image',
                            style:TextStyle(
                              fontFamily: 'Arial Rounded MT',
                              fontSize: 28,
                              color: kTextColor,
                              fontWeight: FontWeight.bold
                            ) ,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 2,),
                      MyCustomButton(
                        color: Colors.blue,
                        text: 'Extract Color',
                        textColor: Colors.white,
                        height: 50,
                        width: 380,
                        borderRadius: 5,
                        onTap:(){} ,
                        textSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial Rounded MT',
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(17, (index) =>
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: colors[index],
                          ),
                        )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(17, (index) =>
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: colors[index],
                              ),
                            )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButtonHoverText(
                            color: kPrimaryColor,
                            text: 'HEX',
                            colorHEX: '#d656512',
                            onTap: (){
                              showBottomToast();
                            },
                          ),
                          const SizedBox(width: 10,),
                          MyButtonHoverText(
                            color: kPrimaryColor,
                            onTap: (){
                              showBottomToast();
                            },
                            text: 'HEB',
                            colorHEX: '#d656512',
                          ),
                          const SizedBox(width: 10,),
                          MyButtonHoverText(
                            color: kPrimaryColor,
                            onTap: (){
                              showBottomToast();
                            },
                            text: 'HSL',
                            colorHEX: '#d656512',
                          ),
                          const SizedBox(width: 10,),
                          MyButtonHoverText(
                            color: kPrimaryColor,
                            onTap: (){
                              showBottomToast();
                            },
                            text: 'RGB',
                            colorHEX: '#d656512',
                          ),
                          const SizedBox(width: 10,),
                          MyButtonHoverText(
                            color: kPrimaryColor,
                            onTap: (){
                              showBottomToast();
                            },
                            text: 'CMYK',
                            colorHEX: '#d656512',
                          ),
                          const SizedBox(width: 10,),
                          MyButtonHoverText(
                            color: kPrimaryColor,
                            onTap: (){
                              showBottomToast();
                            },
                            text: 'RAL',
                            colorHEX: '#d656512',
                          ),
                          const SizedBox(width: 10,),
                          MyButtonHoverText(
                            color: kPrimaryColor,
                            onTap: (){
                              showBottomToast();
                            },
                            text: 'HSV',
                            colorHEX: '#d656512',
                          ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      const SizedBox(height: 50,)

                    ],
                  ),
                )


              ],
            ),
          ),
          const TableAdsAndHistory(),

        ],
      ),
    );
  }
}
