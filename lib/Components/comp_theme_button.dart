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
    return FutureBuilder(
      future: sharedPreferences.getThemeStatus(),
      builder: (context, themeData) {
        return IconButton(
          icon: Icon(
            themeData.data!
                ? Icons.nightlight_round_sharp
                : Icons.wb_sunny_sharp,
            color:
                theme.isLightTheme.value ? Colors.amber[400] : Colors.blue[400],
          ),
          onPressed: () {
            setState(() {
              bool aux = themeData.data!;
              sharedPreferences.saveThemeStatus(!aux);
              Get.changeThemeMode(
                aux ? ThemeMode.light : ThemeMode.dark,
              );
            });
          },
        );
      },
    );
  }
}
