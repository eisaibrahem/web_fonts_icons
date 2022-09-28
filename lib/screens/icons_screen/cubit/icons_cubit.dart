import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/models/icons_model.dart';
import '../../../shared/constants.dart';
import '../../../shared/styles/themes.dart';
import 'icons_state.dart';
import 'package:http/http.dart' as http;

class IconsCubit extends Cubit<IconsStates> {

  IconsCubit() : super(IconsInitialState());

  static IconsCubit get(conIcon) => BlocProvider.of(conIcon);

  final ScrollController scrollController =ScrollController();

  int page=1;
  bool isLoading=false;
  List<String>listOfSVGIcons=[];
  List<String>listOfLinks=[];
 // IconsModel ?iconsModel;

  void initialGetIcons(){
    fetchData();
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent==scrollController.offset){
        fetchData();
        if(searchListIconsLinks.isNotEmpty){

        }
      }
    });
  }
  Future fetchData()async {
    emit(LoadingIconsDateState());
    if (isLoading) return;
    isLoading = true;
    const int limit = 30;
    final url=Uri.parse('$baseURL/icons_paginated?limit=$limit&page=$page');
    try {
      final response = await http.get(url);
      final newItems=json.decode(response.body);
      newItems.forEach((element){
        listOfSVGIcons.add(element['svg']);
        listOfLinks.add('$baseURL/icon/${element['collection'].replaceAll(' ', '%20')}%5C${element['name'].replaceAll(' ', '%20')}');
      });
      // print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
      // print(newItems[1]['svg'].toString());
      // print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
      emit(SuccessGetIconsDateState());
    } catch (e) {
      print('fffffffffffffffffhttpffffffffff');
      print(e.toString());
      print('fffffffffffffffffhttpffffffffff');
      emit(ErrorIconsDateState());
    }
      page++;
      isLoading = false;

  }

  int pageSearch=1;
  List searchListIconsLinks=[];
  List searchListIconsSVG=[];
  Future getSearchIcons(String ?searchText)async{
    emit(LoadingSearchIconsState());
    searchListIconsLinks=[];
    searchListIconsSVG=[];
    const int limit = 30;
    final url=Uri.parse('$baseURL/search?name=$searchText&limit=$limit&page=$pageSearch');
    try{
      final response = await http.get(url);
      final newItems=json.decode(response.body);
      newItems.forEach((element){
        searchListIconsSVG.add(element['svg']);
        searchListIconsLinks.add('$baseURL/icon/${element['collection'].replaceAll(' ', '%20')}%5C${element['name'].replaceAll(' ', '%20')}');
      });
      emit(SuccessGetIconsDateState());
    }
    catch (e) {
      print('fffffffffffffffffsearchffffffffff');
      print(e.toString());
      print('fffffffffffffffffhttpffffffffff');
      emit(ErrorIconsDateState());
    }

  }



  void getHttp() async {
    try {
      var response = await Dio().get('$baseURL/icons?limit=10&page=4');
      print(response);
    } catch (e) {
      print(e);
    }
  }
  String getLinks(int indexDirectory,int indexNameSVG)
  {
      return '$baseURL/icon/${"listOfDirectory[indexDirectory]".replaceAll(' ', '%20')}%5C${listOfSVGIcons[indexNameSVG].replaceAll(' ', '%20')}';
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

  List<Color>listOfTestIconColors=[];

  double iconSizeValueTest = 8;

  Color ?testColor ;

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







  //pagination

















}