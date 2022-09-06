import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/shared/components.dart';
import 'custom_buttons/app_bar_button.dart';
import '../shared/styles/themes.dart';



class CustomAppBar extends StatelessWidget {
  TextEditingController textSearchController=TextEditingController();
  String ?categoryValue;
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Row(
        children:  [
          InkWell(
            onTap: (){

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Container(
                  padding: const EdgeInsets.only(top: 15.75,left: 25.65,bottom: 11.8,right:17.6 ),
                  child: SvgPicture.asset(
                    "assets/icons/Group 1028.svg",
                  ),
                ),
                  Text('Site name',
                  style:TextStyle(
                    fontFamily: 'Berlin Sans FB',
                    fontSize: size.width*0.020,
                  )
                 )
              ],
            ),
          ),
          const SizedBox(width: 10,),
          buildSearchBar(context,size),
          const SizedBox(width:10 ,),
          HoverAppBarButton(
              text: 'Saved',
              assetSVG: "assets/icons/heart-svgrepo-com.svg",
            onTap:(){
                 // navigateTo(context, home6());
            }
          ),
          const SizedBox(width:10 ,),
          HoverAppBarButton(
              text: 'Contact US',
              assetSVG: "assets/icons/message-svgrepo-com.svg",
              onTap: (){

            }
          ),


        ],
      ),
    );
  }


Widget buildSearchBar(BuildContext context,Size size) {
    return Container(
      height: size.width*0.035,
      width:size.width*0.35,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30),

      ),
      child: TextField(
        textAlign: TextAlign.start,
        controller: textSearchController,
        onChanged: (value){

        },
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black
        ),
        maxLines: 1,
        decoration:InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical:  15.0),
          suffixIcon: Container(
            constraints:const BoxConstraints(
              maxWidth: 90,
              minWidth: 50,
            ),
            width: size.width*0.070,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: (){
                  textSearchController.clear();
                }, child:  Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.clear,color: Colors.black,size: size.width*0.020,),
                ),),
                Container(width: 0.5,height: size.width*0.020,color: Colors.grey,),
                InkWell(onTap: (){}, child:  Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.search,color:kHoverColor,size: size.width*0.020,),
                ),),
              ],
            ),
          ),
          prefixIcon :Container(
           margin: const EdgeInsets.all(3),
           width: size.width*0.1,
           decoration: BoxDecoration(
             color: Colors.white,
               borderRadius:BorderRadius.circular(30)
           ),
           child: StatefulBuilder(
             builder:(context,setState)=>Container(
               padding: const EdgeInsets.symmetric(horizontal: 8),
               child: DropdownButton<String>(
                  underline: Container(
                    height: 1,
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                  ),
                  icon:  Icon(Icons.keyboard_arrow_down_outlined,color: kTextColor,size: 26),
                  isExpanded: true,
                  iconEnabledColor: Theme.of(context).primaryColor,
                  iconSize: size.width*0.030,
                  dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                  alignment: Alignment.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ) ,
                  value: categoryValue,
                  items: [
                    DropdownMenuItem(onTap: (){},value:'fonts',child: Text('Fonts',style: TextStyle(fontFamily: 'Arial Rounded MT',color: HexColor('#404456'),),)),
                    DropdownMenuItem(onTap: (){},value:'icons',child: Text('Icons',style: TextStyle(fontFamily: 'Arial Rounded MT',color: HexColor('#404456'),),)),
                    DropdownMenuItem(onTap: (){},value:'colors',child: Text('Colors',style: TextStyle(fontFamily: 'Arial Rounded MT',color: HexColor('#404456'),),)),
                    DropdownMenuItem(onTap: (){},value:'gradients' ,child: Text('Gradients',style: TextStyle(fontFamily: 'Arial Rounded MT',color: HexColor('#404456'),),)),
                  ],
                  onChanged:(String? newValue) {
                    setState((){
                      categoryValue = newValue;
                    });

                  },
                ),
             ),
           ),
         ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,

        ) ,
      ),
    );

}


}
