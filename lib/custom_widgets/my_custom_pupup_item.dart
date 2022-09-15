import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../shared/styles/themes.dart';

class MyCustomPopUpItem extends StatefulWidget {
  final IconData? icon;
  final String? text;
  final String? svg;
  final double width;
  final double? textSize;
  final double? iconSize;
  final double? widthSVG;
  final double? heightSVG;
  final double height;
  final Function()? onTap;

  MyCustomPopUpItem({
    this.icon,
    this.text,
    this.widthSVG=20,
    this.heightSVG=20,
    this.textSize=16,
    this.iconSize=22,
    this.svg,
    this.onTap,
    this.width=160,
    this.height=40,
  });


  bool isHover=false;
  @override
  State<MyCustomPopUpItem> createState() => _MyCustomPopUpItemState();
}

class _MyCustomPopUpItemState extends State<MyCustomPopUpItem> {

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Material(
      elevation: 0,
      child: AnimatedContainer(
        duration:const Duration(milliseconds: 100),
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.003,vertical: size.width*0.003),
        margin: const EdgeInsets.all(2),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color:widget.isHover?Colors.blue[50]:kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: widget.onTap,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 5),
                  child:widget.icon==null?
                  widget.svg==null?SvgPicture.asset('assets/icons/disLike.svg',
                    width: widget.widthSVG,
                    height: widget.heightSVG,
                    color: widget.isHover?kHoverColor:Colors.black,
                  ) :SvgPicture.string(widget.svg??'',
                    width: widget.widthSVG,
                    height: widget.heightSVG,
                    color: widget.isHover?kHoverColor:Colors.black,

                  )
                      :Icon(
                    widget.icon,
                    color:widget.isHover?kHoverColor:Colors.black,
                    size: widget.iconSize,
                  ),
                ),
                const SizedBox(width: 3,),
                Text(widget.text!,
                  style:   TextStyle(
                      fontSize: widget.textSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
