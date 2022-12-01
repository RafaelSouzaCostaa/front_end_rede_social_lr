import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customized_colors_global.dart';

class Themes extends GetxController {
  RxBool isLightTheme = false.obs;

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.cyan,
    scaffoldBackgroundColor: CustomizedColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: CustomizedColors.darkBackground,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0.5,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.pink,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.pink,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.5,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );
}
