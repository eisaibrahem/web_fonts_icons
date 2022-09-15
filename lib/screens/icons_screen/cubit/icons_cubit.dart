import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/styles/themes.dart';
import 'icons_state.dart';

class IconsCubit extends Cubit<IconsStates> {




  IconsCubit() : super(IconsInitialState());

  static IconsCubit get(conIcon) => BlocProvider.of(conIcon);

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

  List<Color>listOfTestIconColors=[];

  double iconSizeValueTest = 8;

  Color testColor =kTextColor;

  void resetColorAndSizeIconTest() {
    testColor=kTextColor;
    backGraundColor =kPrimaryColor;
    iconSizeValueTest=6;
    listOfTestIconColors=[];
    emit(ChangeIconValueTest());
  }

  void changeTestIconColor(Color color) {
    testColor=color;
    emit(ChangeTestIconColorState());
  }

  void changeTestIconGradient(List<Color>value){
    listOfTestIconColors=value;
    emit(ChangeTestIconColorState());
  }

  void changeBackGraundColor(Color color) {
    backGraundColor=color;
    emit(ChangeBackGraundColorState());
  }





  double angelGradient =-1;

  void changeAngelGradient(double value){
    angelGradient=value;
    emit(ChangeAngelGradientState());
  }

  bool isCheckedDownload=false;

  void changeCheckedDownload(value){
    isCheckedDownload =value;
    emit(ChangeCheckedDownloadState());
  }

  int isBold=0;

  void changeWightIcon(value){
    isBold=value;
    emit(ChangeWightIconState());
  }


}