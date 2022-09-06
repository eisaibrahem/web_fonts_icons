import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/shared/styles/themes.dart';

class DownloadButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  DownloadButton({
    required this.icon, required this.text, required this.onTap,
  });

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}
bool isHover=false;
class _DownloadButtonState extends State<DownloadButton> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Material(
      elevation: 1,
      child: AnimatedContainer(
        duration:const Duration(milliseconds: 300),
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.003,vertical: size.width*0.003),
        height: size.width*0.035,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
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
                  padding:  EdgeInsets.all(size.width*0.003),
                  child:Icon(
                    widget.icon,
                    color:isHover?kHoverColor:kTextColor,
                  size: size.width*0.025,
                  ),
                ),
                Text(widget.text,
                  style:  TextStyle(
                    fontFamily: 'Arial Rounded MT',
                    fontSize: size.width*0.016  ,
                    color:isHover?kHoverColor:kTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
