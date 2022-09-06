import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class HoverAppBarButton extends StatefulWidget {
  final String assetSVG;
  final String text;
  final Function() onTap;

   HoverAppBarButton({
      required this.assetSVG, required this.text, required this.onTap,
   });

  @override
  State<HoverAppBarButton> createState() => _HoverAppBarButtonState();
}
bool isHover=false;
class _HoverAppBarButtonState extends State<HoverAppBarButton> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration:const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        height: size.width*0.035,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child:SvgPicture.asset(
                    widget.assetSVG,
                  color:isHover?Colors.blue:HexColor("7E84A3"),
                  height: size.width*0.015,
                  width: size.width*0.015 ,
                ),
              ),
              Text(widget.text,
                style:  TextStyle(
                    fontFamily: 'Arial Rounded MT',
                    fontSize: size.width*0.015  ,
                  color:isHover?Colors.blue:HexColor("7E84A3"),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
