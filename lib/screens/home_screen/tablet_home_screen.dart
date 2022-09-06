import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portfolio/screens/color_palettes_screen/blocky_color.dart';
import 'package:portfolio/screens/home_screen/cubit/home_cubit.dart';
import 'package:portfolio/screens/home_screen/cubit/home_state.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../custom_widgets/custom_app_bar.dart';

class TabletHomeScreen extends StatelessWidget {
  PageController pageController = PageController();
  SidebarXController sidebarXController =
  SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: PreferredSize(
              preferredSize: Size(screenSize.width, 80),
              child: CustomAppBar(),
            ),
            body:Container(
              color: Colors.amber,
            ) ,
          ),
        );
      },
    );
  }



}
