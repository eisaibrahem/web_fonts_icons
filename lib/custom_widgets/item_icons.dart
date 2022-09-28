import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/screens/icons_screen/cubit/icons_cubit.dart';
import 'package:portfolio/screens/icons_screen/cubit/icons_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/icons_screen/icons_details_screen.dart';
import '../screens/quick_view_screen/quick_view_screen.dart';
import '../shared/styles/themes.dart';
import 'custom_buttons/my_custom_button.dart';
import 'custom_buttons/save_button.dart';

class ItemIcons extends StatelessWidget {
  const ItemIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<IconsCubit,IconsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        IconsCubit cubit =IconsCubit.get(context);
        return Container(
          constraints: const BoxConstraints(
              minHeight: 380
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3)),
          child:ConditionalBuilder(
            condition:(state is LoadingSearchIconsState) ,
            builder:(context)=>Center(child: CircularProgressIndicator(color: Colors.grey,),),
            fallback: (context){
              return (cubit.searchListIconsSVG.isNotEmpty)?
              buildItemGradIcons(context: context,cubit: cubit,listOfIcons:cubit.searchListIconsSVG, size: size,)
                  :buildItemGradIcons(context: context,cubit: cubit,listOfIcons:cubit.listOfSVGIcons,size:size);
            },
          ),
        );
      },

    );
  }
Widget buildItemGradIcons({
      required BuildContext context,
      required IconsCubit cubit,
      required List listOfIcons,
      required Size size,
    }){
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context,index){
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
              Expanded(
                child: InkWell(
                  onTap:(){
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          alignment: Alignment.center,
                          child :  IconsDetailsScreen(link:cubit.listOfSVGIcons[index]),
                          duration: const Duration(milliseconds: 200)
                      ),
                    );
                    //navigateTo(context, IconsDetailsScreen(link:cubit.listOfSVGIcons[index]));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                    child:ColorFiltered(
                      //modulate
                      colorFilter:ColorFilter.mode(Colors.black, BlendMode.modulate) ,
                      child: SvgPicture.string(
                        listOfIcons[index],
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
              ),
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
        );
      },
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent:
        size.width<4000&&size.width>2800?
        size.width*0.09:
        size.width<2800&&size.width>2200?
        size.width*0.08:
        size.width<2200&&size.width>2000?
        size.width*0.1:
        size.width<2000&&size.width>1800?
        size.width*0.11:
        size.width<1800&&size.width>1600?
        size.width*0.12:
        size.width<1600&&size.width>1400?
        size.width*0.14:
        size.width<1400&&size.width>1200?
        size.width*0.15:
        size.width*0.05,
        childAspectRatio:
        size.width<1000&&size.width>600?2.3:
        size.width<1200&&size.width>1000?2.8:
        size.width<1400&&size.width>1200?1.01:    //100%
        size.width<1600&&size.width>1400?1.14:
        size.width<1800&&size.width>1600?1.28:
        size.width<2000&&size.width>1800?1.18:      //اول ظهور لل padding
        size.width<2200&&size.width>2000?1.28:     //67%
        size.width<2800&&size.width>2200?1.2:       //50%
        size.width<4600&&size.width>2800?1.2:
        1.6,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,

      ),
      itemCount: cubit.listOfSVGIcons.length,
    );

  }




}
