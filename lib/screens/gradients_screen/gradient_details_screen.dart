import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';
import 'package:portfolio/custom_widgets/custom_buttons/save_button.dart';
import 'package:portfolio/custom_widgets/custom_tost.dart';
import 'package:portfolio/screens/gradients_screen/cubit/gradient_cubit.dart';
import 'package:portfolio/screens/gradients_screen/cubit/gradient_state.dart';

import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_buttons/my_button_hover_text.dart';
import '../../custom_widgets/item_gragient_colors.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/table_of_category.dart';
import '../../shared/styles/themes.dart';
import '../home_screen/cubit/home_cubit.dart';
import '../home_screen/cubit/home_state.dart';
import '../home_screen/home_screen.dart';
import '../palettes_screen/blocky_color.dart';

class GradientDetailsScreen extends StatefulWidget {
  const GradientDetailsScreen({Key? key}) : super(key: key);

  @override
  State<GradientDetailsScreen> createState() => _GradientDetailsScreenState();
}

class _GradientDetailsScreenState extends State<GradientDetailsScreen> {
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
bool isHover=false;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.width*0.050),
        child: CustomAppBar(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TableOfCategory(),
          BlocConsumer<GradientCubit,GradientStates>(
            listener: (context, state) {

            },
            builder: (context, state) {
              GradientCubit gradientCubit =GradientCubit.get(context);
              return Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width:size.width,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              MouseRegion(
                                onEnter: (event) {
                                  setState(() {
                                    isHover=true;
                                  });

                                },
                                onExit: (event) {
                                  setState(() {
                                    isHover=false;
                                  });
                                },
                                child: Container(
                                  height: 350,
                                  width: 400,
                                  alignment: Alignment.center,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF3366FF),
                                          Color(0xFF00CCFF),
                                        ],
                                        begin: FractionalOffset(0.0, 0.0),
                                        end: FractionalOffset(1.0, 0.0),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                ),
                              ),
                              isHover? Positioned(
                                top: 10,
                                left: 10,
                                child: InkWell(
                                  onTap: (){
                                    showBottomToast();
                                    Clipboard.setData(ClipboardData(text: 'ok copy'));
                                  },
                                  child: const Icon(
                                    Icons.copy,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ):const SizedBox(),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            alignment: Alignment.center,
                            width:400,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kPrimaryColor,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('By :Mark Goldbridge',
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                MyCustomButton(
                                  text: 'CC34343',
                                  height: 40,
                                  width: 100,
                                  fontFamily: 'Arial Rounded MT',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  borderRadius: 5,
                                  textSize: 18,
                                  textColor: kTextColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                MyCustomButton(
                                  icon: Icons.download,
                                  iconSize: 26,
                                  borderRadius: 50,
                                  color: Colors.white,
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(width: 10,),
                                SaveButton(
                                  borderRadius: 50,
                                  color: Colors.white,
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 10,)

                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index)
                            => Padding (
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: colors[index],
                              ),
                            )

                            ),
                          ),
                          const SizedBox(height: 10,),
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
                          const SizedBox(height: 5,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 10),
                        child: Text('Explore Another Colors Palette',
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 24,
                            fontFamily: 'Arial Rounded MT',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GridView.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 1,
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 1.01,
                        scrollDirection: Axis.vertical,
                        children: List.generate(60, (index){
                          return ItemGragientColors();
                        }
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const TableAdsAndHistory(),
        ],
      ),
    );
  }
}
