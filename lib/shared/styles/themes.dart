import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

const Color kPrimaryColor= Color(0xfff4f7fc);
 Color kTextColor=  HexColor('#7E84A3');
 Color kHoverColor= HexColor('#4878C7');

// Color blueee= Colors.blue[50];

class Themeprovider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;
}

ThemeData lightMode(BuildContext context){
  return ThemeData(
      cardColor:kPrimaryColor,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.grey.shade100,
    ),
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey.shade100,
    canvasColor :kPrimaryColor,
      primaryColor: kPrimaryColor,
      secondaryHeaderColor: Colors.white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kPrimaryColor,
      ),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: kPrimaryColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: kPrimaryColor,
          statusBarIconBrightness:Brightness.dark,


        ),
        elevation: 0.0,
        iconTheme: IconThemeData(
            color: Colors.black
        )

    ),

      fontFamily: 'Tajawal',
      textTheme: (Theme.of(context).textTheme).copyWith(
          bodyText1:  const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          subtitle1:   TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade500,
            height: 1.3,

          )
      ),

    iconTheme: const IconThemeData(color: Colors.white),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor:kPrimaryColor,
    )

  );
}
ThemeData darkMode(BuildContext context){
  return ThemeData(
    cardColor:Colors.grey.shade800,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.grey.shade900,

    ),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor:Colors.grey.shade900,
    canvasColor:Colors.grey.shade900,
    primaryColor: Colors.white ,
    secondaryHeaderColor: Colors.grey.shade800,

    floatingActionButtonTheme:  FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade900,
    ),
    appBarTheme:  AppBarTheme(
        titleSpacing: 20.0,
        titleTextStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: HexColor("333739"),
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: HexColor("333739"),
          statusBarIconBrightness:Brightness.light,


        ),
        elevation: 0.0,
        iconTheme: const IconThemeData(
            color: Colors.white
        )

    ),

    fontFamily: 'Tajawal',
    textTheme: (Theme.of(context).textTheme).copyWith(
        bodyText1:  const TextStyle(
          fontSize: 14.0,
          height: 1.2,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        subtitle1: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            height: 1.3
        )
    ),

  );

}