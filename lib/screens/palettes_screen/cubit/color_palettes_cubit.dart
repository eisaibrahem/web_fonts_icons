import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_palettes_state.dart';

class PalettesCubit extends Cubit<PalettesStates> {


  PalettesCubit() : super(ColorPalettesInitialState());

  static PalettesCubit get(context) => BlocProvider.of(context);

  String popularValue='Popular';
  void changePopularValue(String? newValue) {
    popularValue = newValue!;
    emit(ChangePopularValueState());
  }

  List<Color>listOfPaletteColors=[];
  void changeListOfPaletteColors(List<Color>value){
    listOfPaletteColors=value;
    emit(ChangeListOfPaletteColorsState());
  }

 bool isMore=false;
  void showMore() {
    isMore=!isMore;
    emit(ShowMoreState());
  }


  List<bool> selectedPalettes = [true, false, false, false,false,false,false,false,false];
  void selectPalettes(int n) {
    for (int i = 0; i < 9; i++) {
      if (i == n) {
        selectedPalettes[i] = true;
      } else {
        selectedPalettes[i] = false;
      }
      emit(SelectedPalettesState());
    }
  }
  
}