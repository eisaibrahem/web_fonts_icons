import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../shared/styles/themes.dart';

class MyCustomPopUpItem extends StatefulWidget {
  final IconData? icon;
  final String? text;
  final String? svg;
  final double width;
  final double height;
  final Function()? onTap;

  MyCustomPopUpItem({
    this.icon,
    this.text,
    this.svg,
    this.onTap,
    this.width=160,
    this.height=40,
  });



  @override
  State<MyCustomPopUpItem> createState() => _MyCustomPopUpItemState();
}
bool isHover=false;
class _MyCustomPopUpItemState extends State<MyCustomPopUpItem> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Material(
      elevation: 0,
      child: AnimatedContainer(
        duration:const Duration(milliseconds: 300),
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.003,vertical: size.width*0.003),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color:isHover?kPrimaryColor:Colors.white,
          borderRadius: BorderRadius.circular(1),
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
            child: Row(
              children: [
                Padding(
                  padding:  const EdgeInsets.all(5),
                  child:widget.icon==null?
                  SvgPicture.string(widget.svg??'',width: 20,height: 20,color: isHover?kHoverColor:Colors.grey,)
                      :Icon(
                    widget.icon,
                    color:isHover?kHoverColor:kTextColor,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 5,),
                Text(widget.text!,
                  style:  const TextStyle(
                      fontSize: 16,
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
