import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:portfolio/shared/styles/themes.dart';

class TestCustonPopupScreen extends StatefulWidget {
  @override
  _TestCustonPopupScreenState createState() => _TestCustonPopupScreenState();
}

class _TestCustonPopupScreenState extends State<TestCustonPopupScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPopupMenu'),
      ),
      body: Container(

        child: Column(
          children: [

            Container(
              width: 200,
              height: 100,
              color: Colors.grey,
            ),Container(
              width: 200,
              height: 100,
              color: Colors.grey,
            ),Container(
              width: 200,
              height: 100,
              color: Colors.grey,
            ),
            Card(
              elevation: 3,
              margin: const EdgeInsets.all(10),
              color: kTextColor,
              child: InkWell(
                onTap: (){
                  showColorPiker(context,);
                },
                child: const SizedBox(
                  height: 40,
                  width: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showColorPiker(BuildContext context, ){
    showDialog(
      context: context,
      builder:(context)=> Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          scrollable: true,
          //actionsPadding:EdgeInsets.zero ,
          contentPadding: EdgeInsets.all(5),
          //insetPadding: EdgeInsets.zero,
          content: ColorPicker(
            pickerColor: kTextColor,
            onColorChanged: (color){
                  setState(() {
                    kTextColor=color;
                  });
            },
            enableAlpha: false,
            paletteType: PaletteType.hsvWithHue,
            portraitOnly: true,

            pickerAreaBorderRadius:BorderRadius.circular(10) ,
            pickerAreaHeightPercent: 0.3,
            colorPickerWidth: 0.3,
            displayThumbColor: true,
            labelTypes: const [],
          ),

        ),
      ),
    );
  }
}

