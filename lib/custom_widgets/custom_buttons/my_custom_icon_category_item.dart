import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/styles/themes.dart';

class MyCustomIconCategoryItem extends StatefulWidget {
  final String? text;
  final String? svg;
  final String? fontFamily;
  final double width;
  final double textSize;
  final double paddingHorizontal;
  final double paddingVertical;
  final double height;
  final Function()? onTap;
  final Color? color;
  final Color? colorHover;
  final FontWeight fontWeight;


  MyCustomIconCategoryItem({
    this.text,
    this.svg,
    this.fontFamily='Arial Rounded MT',
    this.onTap,
    this.width=65,
    this.height=25,
    this.textSize=14,
    this.color=Colors.white,
    this.colorHover=kPrimaryColor,
    this.paddingVertical=2,
    this.paddingHorizontal=3,
    this.fontWeight=FontWeight.bold,
  });



  @override
  State<MyCustomIconCategoryItem> createState() => _MyCustomIconCategoryItemState();
}
bool isHover=false;
class _MyCustomIconCategoryItemState extends State<MyCustomIconCategoryItem> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration:const Duration(milliseconds: 200),
        padding:   EdgeInsets.symmetric(horizontal: widget.paddingHorizontal,vertical: widget.paddingVertical),
        margin: const EdgeInsets.only(right: 5,bottom: 2),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color:isHover?widget.colorHover:widget.color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: MouseRegion(
          onEnter: (f){
            setState(() {
              isHover=true;
            });
          },
          onExit:  (f){
            setState(() {
              isHover=false;
            });
          },
          child: Text(widget.text!,
            style:   TextStyle(
                fontSize: widget.textSize,
                color: HexColor('8A8FAB'),
                fontWeight:widget.fontWeight,
                fontFamily: widget.fontFamily,
            ),
          ),
        ),
      ),
    );

  }
}
