import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/shared/styles/themes.dart';

import '../../../models/fonts_model.dart';
import '../../../models/fonts_model.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';
import '../fonts_screen.dart';
import 'fonts_states.dart';

class FontsCubit extends Cubit<FontsStates> {


  FontsCubit() : super(FontsInitialState());

  static FontsCubit get(context) => BlocProvider.of(context);


  FontsModel ? fontsModel;
  List<String>listOfFontsName=[];
 Future<void> getFontsData() async{
    emit(LoadingFontsDateState());

   await DioHelper.getData(
      url: FONTS,
    ).then((value) {
      fontsModel = FontsModel.fromJson(value.data);
      fontsModel?.children.forEach((element) {
        element.children.forEach((element) {
          listOfFontsName.add(element.name!);
        });
      });
// باخد من ليست ال products احط فى لست ال favorites
      print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
      print('number of fonts name >>> '+ listOfFontsName.length.toString());
      print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');

      emit(SuccessGetFontsDateState());

    }).catchError((error) {
      print('fffffffffffffffffontsfffffffffffffffff');
      print(error.toString());
      print('fffffffffffffffffffffffffffffffff');
      emit(ShopErrorFontsDateState());
    });
  }
  
  

  List<String> alphabets=[];
  void getAlphabets(){
    for(int i=65; i<=90; i++){
      alphabets.add(String.fromCharCode(i));
    }
    emit(GetAlphabetsState());
  }

  double fontSizeValueTest = 8;
  void changeFontsSizedValueTest(double value){
    fontSizeValueTest =value;
    emit(ChangeFontsSizedValueTestState());
  }

  Color testColor =kTextColor;
  void changeTestTextColor(Color color) {
    testColor=color;
  emit(ChangeTestTextColorState());
  }
  void changeBackGraundColor(Color color) {
    backGraundColor=color;
    emit(ChangeBackGraundColorState());
  }

  String testText='';
  void changeTextValueTest(String value) {
    testText=value;
    emit(ChangeTextValueTest());
  }

  void resetColorAndSizeFontTest() {
    testColor=kTextColor;
    backGraundColor =kPrimaryColor;
    fontSizeValueTest=6;
    listOfTestTextColors=[];
    emit(ChangeTextValueTest());
  }

  List<Color>listOfTestTextColors=[];
  void changeTestTextGradient(List<Color>value){
    listOfTestTextColors=value;
    emit(ChangeTestTextColorState());
  }

  void clearTextTest() {
    FontsScreen.testFontController.clear();
    emit(ChangeTextValueTest());
  }
 String popularValue='Popular';
  void changePopularValue(String? newValue) {
    popularValue = newValue!;
    emit(ChangePopularValueState());
  }


  bool isGradientPicker=false;
  void changPaletToGradientPalet(){
    isGradientPicker=true;
    emit(ChangPaletOfColorPeckerState());
  }
  void changPaletToColorPalet(){
    isGradientPicker=false;
    emit(ChangPaletOfColorPeckerState());
  }

  Color backGraundColor =kPrimaryColor;
  bool isBackGraundColor=false;
  void useBackGraundPalet(){
    isBackGraundColor=true;
    emit(UseBackGraundPaletState());
  }
  void useColorPecker(){
    isBackGraundColor=false;
    emit(UseBackGraundPaletState());
  }

  double angelGradient =-1;

  void changeAngelGradient(double value){
    angelGradient=value;
    emit(ChangeAngelGradientState());
  }

ScrollController scrollFontsCategoryController=ScrollController();
  bool isCategoryScrollRight=false;

  void changeCategoryScroll(){
    scrollFontsCategoryController.addListener(() {
      if(scrollFontsCategoryController.position.maxScrollExtent==scrollFontsCategoryController.offset){
        isCategoryScrollRight=true;
        emit(ChangeCategoryScrollState());
      }else{
        isCategoryScrollRight=false;
        emit(ChangeCategoryScrollState());
      }

    });

  }
  Alignment testAlignment=Alignment.center;
  void changeAlignment({required Alignment alignment}) {
    testAlignment=alignment;
    emit(ChangeAlignmentTestTextState());
  }





  }