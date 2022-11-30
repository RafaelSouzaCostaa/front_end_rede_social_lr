import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Colors/themes.dart';
import '../Global/shared_preferences.dart';

class ComponentThemeButton extends StatefulWidget {
  const ComponentThemeButton({super.key});

  @override
  State<ComponentThemeButton> createState() => _ComponentThemeButtonState();
}

class _ComponentThemeButtonState extends State<ComponentThemeButton> {
  InstanceSharedPreference sharedPreferences = InstanceSharedPreference();
  Themes theme = Get.put(Themes());

  @override
  Widget build(BuildContext context) {
    bool themeData = true;
    return IconButton(
      icon: Icon(
        themeData ? Icons.wb_sunny_sharp : Icons.nightlight_round_sharp,
        color: theme.isLightTheme.value ? Colors.amber[400] : Colors.blue[400],
      ),
      onPressed: () {
        setState(() {
          theme.isLightTheme.value = !theme.isLightTheme.value;
          bool themeData = sharedPreferences.getThemeStatus() as bool;
          sharedPreferences.saveThemeStatus(!themeData);

          Get.changeThemeMode(
            theme.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
          );
        });
      },
    );
  }
}
