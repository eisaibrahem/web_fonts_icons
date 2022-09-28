import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:like_button/like_button.dart';

import '../../screens/fonts_screen/fonts_screen.dart';
import '../../shared/styles/themes.dart';

class SaveButton extends StatefulWidget {
final double height;
final Future<bool?> Function(bool)? onTap;
final double width;
final double widthSVG;
final double heightSVG;
final double paddingVertical;
final double elevation;
final double borderRadius;
final double iconsSize;
final Color color;


SaveButton({
  this.height=30,
  this.onTap,
  this.paddingVertical=3,
  this.width=50,
  this.widthSVG=20,
  this.heightSVG=20,
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
        borderRadius:BorderRadius.circular(widget.borderRadius),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: widget.paddingVertical),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          width: widget.width,
          height: widget.height,
          child: LikeButton(
            onTap: widget.onTap,
            bubblesSize: 0,
            circleSize: 0,
            padding: EdgeInsets.zero,
            size:widget.iconsSize,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            animationDuration:
            const Duration(milliseconds: 200),
            likeBuilder: (bol) {
              return bol
                  ? Image.asset('assets/images/like.png',
                height:widget.widthSVG,
                width: widget.heightSVG,
                color: kTextColor,
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
                child: Image.asset('assets/images/disLike.png',
                  color:  widget.isHover?kHoverColor:Colors.grey,
                  height:widget.widthSVG,
                  width: widget.heightSVG,
                ),
              );
            },
          ),
        ),
      ),
    );





  }
}
