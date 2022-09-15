import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'gradient_state.dart';

class GradientCubit extends Cubit<GradientStates> {


  GradientCubit() : super(GradientInitialState());

  static GradientCubit get(context) => BlocProvider.of(context);

  String popularValue='Popular';
  void changePopularValue(String? newValue) {
    popularValue = newValue!;
    emit(ChangePopularValueState());
  }

  List<Color>listOfGradientColors=[];
  void changeListOfPaletteColors(List<Color>value){
    listOfGradientColors=value;
    emit(ChangeListOfGradientColorsState());
  }



  List<bool> selectedGradientCategoryNumbersList = [true, false, false, false,false,false,false,false,false];
  void selectGradientCategoryNumber(int n) {
    for (int i = 0; i < 9; i++) {
      if (i == n) {
        selectedGradientCategoryNumbersList[i] = true;
      } else {
        selectedGradientCategoryNumbersList[i] = false;
      }
      emit(SelectGradientCategoryNumberState());
    }
  }




}