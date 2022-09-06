import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);




  List<bool> selectedHistory = [true, false, false, false,];

  void selectCategoryHistory(int n) {
    for (int i = 0; i < 4; i++) {
      if (i == n) {
        selectedHistory[i] = true;
      } else {
        selectedHistory[i] = false;
      }
      emit(SelectedCategoryHistoryState());
    }
  }



}