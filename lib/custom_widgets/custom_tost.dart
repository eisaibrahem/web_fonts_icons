import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/shared/styles/themes.dart';

class MyCustomToast extends StatelessWidget {
  const MyCustomToast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 115,
      height: 35,
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          SvgPicture.string(doneSVG,color: kTextColor,width: 25,height: 25),
          const SizedBox(width: 5,),
           Text('Copied',
          style: TextStyle(
            fontFamily: 'Arial Rounded MT',
            color: kTextColor,
            fontSize: 20,
          ),
          ),
        ],
      ),
    );
  }
}

String doneSVG='''<svg id="Icon_ionic-ios-checkmark-circle-outline" data-name="Icon ionic-ios-checkmark-circle-outline" xmlns="http://www.w3.org/2000/svg" width="32.534" height="32.534" viewBox="0 0 32.534 32.534">
  <path id="Path_588" data-name="Path 588" d="M27.186,13.716,25.81,12.3a.3.3,0,0,0-.219-.094h0a.284.284,0,0,0-.219.094l-9.541,9.612-3.472-3.472a.3.3,0,0,0-.438,0l-1.392,1.392a.312.312,0,0,0,0,.446l4.38,4.38a1.385,1.385,0,0,0,.915.446,1.451,1.451,0,0,0,.907-.43h.008L27.194,14.161A.334.334,0,0,0,27.186,13.716Z" transform="translate(-2.582 -2.384)" fill="#525667"/>
  <path id="Path_589" data-name="Path 589" d="M19.642,5.565A14.072,14.072,0,1,1,9.686,9.686a13.984,13.984,0,0,1,9.956-4.121m0-2.19A16.267,16.267,0,1,0,35.909,19.642,16.264,16.264,0,0,0,19.642,3.375Z" transform="translate(-3.375 -3.375)" fill="#525667"/>
</svg>
''';