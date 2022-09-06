import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'icons_state.dart';

class IconsCubit extends Cubit<IconsStates> {


  IconsCubit() : super(IconsInitialState());

  static IconsCubit get(context) => BlocProvider.of(context);

  String popularValue='Popular';
  void changePopularValue(String? newValue) {
    popularValue = newValue!;
    emit(ChangePopularValueState());
  }
}