import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Colors/customized_colors_global.dart';

class Themes extends GetxController {
  RxBool isLightTheme = false.obs;

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: CustomizedColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: CustomizedColors.darkBackground,
      centerTitle: true,
    ),
    primarySwatch: Colors.blue,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
    primarySwatch: Colors.purple,
  );
}
