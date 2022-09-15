import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/shared/components.dart';
import 'package:portfolio/shared/styles/themes.dart';

class MyButtonHoverText extends StatefulWidget {

  final double textSize;
  final double height;
  final double width;
  final double borderRadius;
  final Color? color;
  final Color? textColor;
  final String? text;
  final String? colorHEX;
  final FontWeight? fontWeight;
  final Function()? onTap;

  MyButtonHoverText({
    this.width=100,
    this.height=40,
    this.textSize=16,
    this.color,
    this.borderRadius=5,
    this.textColor,
    this.text,
    this.fontWeight,
    this.colorHEX,
    this.onTap
});
  @override
  State<MyButtonHoverText> createState() => _MyButtonHoverTextState();
}

class _MyButtonHoverTextState extends State<MyButtonHoverText> {
  bool isHover=false;
  @override
  Widget build(BuildContext context) {
    // Clipboard.setData(ClipboardData(text: widget.colorHEX));
    // showToast(text: 'done', state: ToastStates.Copied);
    return InkWell(
      onTap: widget.onTap,
      radius: widget.borderRadius,
      child: Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.color,
        ),
        child:MouseRegion(
          onEnter: (f){
            setState(() {
              isHover=true;
            });
          },
          onExit:(f){
            setState(() {
              isHover=false;
            });
          },
          child: Text(isHover?widget.colorHEX??'' : widget.text??'',
          style: TextStyle(
            fontFamily: 'Arial Rounded MT',
            color: widget.textColor??kTextColor,
            fontSize: widget.textSize,
            fontWeight: widget.fontWeight??FontWeight.bold,
          ),
          ),
        ),
      ),
    );
  }
}
