import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Colors/themes.dart';
import 'token.dart';

class InstanceSharedPreference {
  //pegar tdo aqui se
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  Token token = Get.put(Token());
  Themes theme = Get.put(Themes());

  saveTokenStatus() async {
    SharedPreferences pref = await prefs;
    pref.setString('token', token.token.value);
  }

  getToken() async {
    var savedToken = prefs.then((SharedPreferences prefs) {
      //se tiver vazio retorna tema claro, se não retorna o tema
      return prefs.getString('token') ?? "";
    }).obs;
    token.token.value = savedToken.value.toString();
  }

  //Themes
  saveThemeStatus(themeData) async {
    SharedPreferences pref = await prefs;
    pref.setBool('theme', themeData);
  }

  Future<bool> getThemeStatus() async {
    bool themeData;
    var isLight = prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    // theme.isLightTheme.value = await isLight.value;
    // Get.changeThemeMode(
    //   theme.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
    // );
    themeData = await isLight.value;
    return themeData;
  }
}
