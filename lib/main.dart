import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/screens/fonts_screen/fonts_cubit/fonts_cubit.dart';
import 'package:portfolio/screens/fonts_screen/fonts_screen.dart';
import 'package:portfolio/screens/gradients_screen/cubit/gradient_cubit.dart';
import 'package:portfolio/screens/home_screen/cubit/home_cubit.dart';
import 'package:portfolio/screens/home_screen/cubit/home_state.dart';
import 'package:portfolio/screens/icons_screen/cubit/icons_cubit.dart';
import 'package:portfolio/screens/palettes_screen/cubit/color_palettes_cubit.dart';
import 'package:portfolio/shared/styles/themes.dart';
import 'Layout/Layout_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context)=>HomeCubit(),
        ),
        BlocProvider(
          create: (context)=>FontsCubit()..getAlphabets(),
        ),
        BlocProvider(
          create: (context)=>IconsCubit(),
        ),
        BlocProvider(
          create: (context)=>PalettesCubit(),
        ), BlocProvider(
          create: (context)=>GradientCubit(),
        ),

      ],
      child: BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return MaterialApp(
          title: 'Eisa Website',
          theme: lightMode(context,),
          darkTheme: darkMode(context),
          themeMode:ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home:  FontsScreen(),
        );
      },

    ),
    );
  }
}
