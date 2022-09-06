import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../shared/styles/themes.dart';

class MyCustomButton extends StatefulWidget {
  final Function()? onTap;
  final Widget? iconWidget;
  final IconData? icon;
  final FontWeight fontWeight;
  final Color? iconColor;
  final double? iconSize;
  final String? assetSVG;
  final String? text;
  final String? toolTip;
  final String? fontFamily;
  final double paddingHorizontal;
  final double paddingVertical;
  final double marginHorizontal;
  final double marginVertical;
  final double? textSize;
  final double height;
  final double? width;
  final double borderRadius;
  final double elevation;
  final Color? color;
  final Color? textColor;
  final Color? svgColor;
   MyCustomButton({Key? key,
        this.iconWidget,
        this.iconColor,
        this.fontWeight=FontWeight.bold,
        this.iconSize,
        this.onTap,
        this.toolTip,
        this.text,
        this.icon,
        this.assetSVG,
        this.height=30,
        this.width,
        this.paddingHorizontal=5,
        this.paddingVertical=5,
        this.borderRadius=30,
        this.elevation=0,
        this.color=kPrimaryColor,
        this.textColor,
        this.svgColor,
        this.fontFamily,
        this.textSize,
        this.marginHorizontal=0,
        this.marginVertical=0,
      }) : super(key: key);

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  bool isHover=false;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return JustTheTooltip(
      content: Container(
        padding:widget.toolTip!=null? const EdgeInsets.all(5):EdgeInsets.zero ,
        decoration: BoxDecoration(
          color:widget.toolTip!=null? Colors.black:Colors.transparent,
          borderRadius:
          BorderRadius.circular(5),
        ),
        child:  Text(
          widget.toolTip??'',
          style:  TextStyle(
            color: widget.toolTip!=null? Colors.white:Colors.transparent,
            fontSize: 12,
          ),
        ),
      ),
      elevation: 1,
      barrierDismissible: true,
      tailBaseWidth: 8,
      tailLength: 6,
      backgroundColor:widget.toolTip!=null? Colors.black:Colors.transparent,
      waitDuration:
      const Duration(milliseconds: 350),
      preferredDirection: AxisDirection.down,
      child: Material(
        elevation: widget.elevation,
        child: AnimatedContainer(
          alignment: Alignment.center,
          duration:const Duration(milliseconds: 300),
          margin:  EdgeInsets.symmetric(horizontal: widget.marginHorizontal,vertical: widget.marginVertical),
          padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal,vertical: widget.paddingVertical),
          height: widget.height,
          width:widget.width,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: InkWell(
            onTap: widget.onTap,
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
              child:widget.iconWidget ?? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.assetSVG!=null?  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:SvgPicture.asset(
                      widget.assetSVG!,
                      color:isHover?kHoverColor:widget.svgColor??kTextColor,
                      height: size.width*0.015,
                      width: size.width*0.015 ,
                    ),
                  ):(widget.icon!=null)? Icon(
                    widget.icon,
                    color:isHover?kHoverColor:widget.iconColor??kTextColor,
                    size:widget.iconSize??18,
                  ):Container(),
                  widget.text!=null? Text(widget.text!,
                    style:  TextStyle(
                      fontFamily: widget.fontFamily,
                      height: 1,
                      fontWeight: widget.fontWeight,
                      fontSize: widget.textSize??size.width*0.015,
                      color:isHover?kHoverColor:widget.textColor??kTextColor,
                    ),
                  ):Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
