import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/styles/themes.dart';

class MyCustomCategoryItem extends StatefulWidget {
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


  MyCustomCategoryItem({
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


  bool isHover=false;
  @override
  State<MyCustomCategoryItem> createState() => _MyCustomCategoryItemState();
}

class _MyCustomCategoryItemState extends State<MyCustomCategoryItem> {
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
          color:widget.isHover?widget.colorHover:widget.color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: MouseRegion(
          onEnter: (f){
            setState(() {
              widget.isHover=true;
            });
          },
          onExit:  (f){
            setState(() {
              widget.isHover=false;
            });
          },
          child: Text(widget.text!,
            style:TextStyle(
                fontSize: widget.textSize,
                color:widget.isHover?kHoverColor: HexColor('8A8FAB'),
                fontWeight:widget.fontWeight,
                fontFamily: widget.fontFamily,
            ),
          ),
        ),
      ),
    );

  }
}
