import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/custom_widgets/custom_buttons/my_custom_button.dart';
import 'package:portfolio/custom_widgets/custom_buttons/save_button.dart';
import 'package:portfolio/custom_widgets/custom_tost.dart';
import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/custom_buttons/my_button_hover_text.dart';
import '../../custom_widgets/item_gragient_colors.dart';
import '../../custom_widgets/item_palette.dart';
import '../../custom_widgets/table_ads_and_history.dart';
import '../../custom_widgets/nav_bar_category.dart';
import '../../shared/styles/themes.dart';
import '../home_screen/cubit/home_cubit.dart';
import '../home_screen/cubit/home_state.dart';
import '../home_screen/home_screen.dart';
import '../palettes_screen/blocky_color.dart';
import 'cubit/color_palettes_cubit.dart';
import 'cubit/color_palettes_state.dart';

class PalettesDetailsScreen extends StatefulWidget {
  const PalettesDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PalettesDetailsScreen> createState() => _PalettesDetailsScreenState();
}

class _PalettesDetailsScreenState extends State<PalettesDetailsScreen> {
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
      child: const MyCustomToast(),
      positionedToastBuilder: (context,child){
        return Positioned(bottom: 10,left: 510,child: child,);
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
        preferredSize: Size(size.width,65),
        child: CustomAppBar(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavBarCategory(),
          BlocConsumer<PalettesCubit,PalettesStates>(
            listener: (context, state) {

            },
            builder: (context, state) {
              PalettesCubit cubit =PalettesCubit.get(context);
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
                          const SizedBox(height: 30,),
                          Container(
                              height: 300,
                              width: 880,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: buildListOFColorsPalette()),
                          const SizedBox(height: 8,),
                          Container(
                            alignment: Alignment.center,
                            width:880,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
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
                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index)
                            => Padding (
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: colors[index],
                              ),
                            )

                            ),
                          ),
                          const SizedBox(height: 30,),
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
