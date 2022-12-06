import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Colors/themes.dart';
import 'token.dart';

class InstanceSharedPreference {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  Token token = Get.put(Token());
  Themes theme = Get.put(Themes());

  //Token
  saveTokenStatus() async {
    SharedPreferences pref = await prefs;
    pref.setString('token', token.token.value);
  }

  getToken() async {
    var savedToken = prefs.then((SharedPreferences prefs) {
      return prefs.getString('token') ?? "";
    }).obs;
    token.token.value = savedToken.value.toString();

    return token.token.value;
  }

  //Themes
  saveThemeStatus() async {
    SharedPreferences pref = await prefs;
    pref.setBool('theme', theme.isLightTheme.value);
  }

  getThemeStatus() async {
    var isLight = prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    theme.isLightTheme.value = await isLight.value;
    Get.changeThemeMode(
      theme.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
    );
  }
}
