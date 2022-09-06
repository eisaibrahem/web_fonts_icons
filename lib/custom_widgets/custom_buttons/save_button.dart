import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:like_button/like_button.dart';

import '../../screens/fonts_screen/fonts_screen.dart';
import '../../shared/styles/themes.dart';

class SaveButton extends StatefulWidget {
final double height;
final double width;
final double elevation;
final double borderRadius;
final double iconsSize;
final Color color;


SaveButton({
  this.height=30,
  this.width=50,
  this.elevation=0,
  this.borderRadius=3,
  this.color=kPrimaryColor,
  this.iconsSize=30,

});


  bool isHover=false;
  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return JustTheTooltip(
      content: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius:
          BorderRadius.circular(5),
        ),
        child: const Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
      elevation: 1,
      barrierDismissible: true,
      tailBaseWidth: 8,
      tailLength: 6,
      backgroundColor: Colors.black,
      waitDuration:
      const Duration(milliseconds: 350),
      preferredDirection: AxisDirection.down,
      child: Material(
        elevation: widget.elevation,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          width: widget.width,
          height: widget.height,
          child: LikeButton(
            bubblesSize: 0,
            circleSize: 0,
            size:widget.iconsSize,
            animationDuration:
            const Duration(milliseconds: 200),
            likeBuilder: (bol) {
              return bol
                  ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
                child: SvgPicture.string(likeSVG),
              )
                  : MouseRegion(
                onEnter: (event){
                  setState(() {
                    widget.isHover=true;
                  });

                },
                onExit: (e){
                  setState(() {
                    widget.isHover=false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
                  child: SvgPicture.string(disLikeSVG,
                    color:  widget.isHover?kHoverColor:Colors.grey,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );





  }
}
