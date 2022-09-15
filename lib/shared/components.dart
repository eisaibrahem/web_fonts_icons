import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/shared/styles/themes.dart';


Widget defaultButton({
  double width = double.infinity,
  bool isUpperCase = true,
  double radius = 3.0,
  required  Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
    //    gradient: kMySecGradient,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required Function() function,
  required String text,
  Color color = Colors.blue,
}) =>
    TextButton(
      onPressed: function,
      style: TextButton.styleFrom(
      primary: color,
    ),
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      style: const TextStyle(
        fontSize: 16,
        letterSpacing: 0.0,
      ),
      maxLines: 1,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelStyle:  TextStyle(
          fontSize: 16,
          letterSpacing: 2.0,
          color: kPrimaryColor
        ),
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0,),
          borderSide:  BorderSide(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          prefix,
          color: kPrimaryColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
        ),
      ),
    );

Widget myAppBar(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*.1,
    decoration:  BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(20) ,bottomRight: Radius.circular(20)),
    ),
    child: Container(
      padding: const EdgeInsets.all(20) ,
      alignment:Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.1,
      child: Image.asset('assets/images/logo.png',
        scale: 1,
      ),
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[400],
      ),
    );

void navigateTo(BuildContext context,Widget widget) =>
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        alignment: Alignment.center,
        child : widget,
        duration: const Duration(milliseconds: 300)
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.leftToRightWithFade,
        child : widget,
          duration: const Duration(milliseconds: 500),

      ),
      (route) {
        return false;
      },
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      webPosition:"bottom center",
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor:kTextColor,
      fontSize: 18.0,
    );

// enum
enum ToastStates {SUCCESS, ERROR, WARNING,Copied}

Color chooseToastColor(ToastStates state)
{
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
      case ToastStates.Copied:
      color = Colors.white;
      break;
  }

  return color;
}



