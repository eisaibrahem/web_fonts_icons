import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  TextEditingController textSearchController=TextEditingController();

  String  categoryValue ='fonts';
  void changeSearchCategoryValue(String? newValue) {
    categoryValue =newValue!;
    emit(ChangeSearchCategoryValueState());
  }
  String searchText='';
  void searchForCategory(String value) {
    searchText=value;
    print(searchText);
    emit(ChangeSearchCategoryValueState());
  }

  void clearTextsearch() {
    textSearchController.clear();
    emit(ChangeSearchCategoryValueState());
  }



}