import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Colors/themes.dart';

class ComponentAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ComponentAppBar({super.key});

  @override
  State<ComponentAppBar> createState() => _ComponentAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _ComponentAppBarState extends State<ComponentAppBar> {
  Themes theme = Get.put(Themes());
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  saveThemeStatus() async {
    SharedPreferences pref = await prefs;
    pref.setBool('theme', theme.isLightTheme.value);
  }

  getThemeStatus() async {
    var isLight = prefs.then((SharedPreferences prefs) {
      //se tiver vazio retorna tema claro, se não retorna o tema
      return prefs.getBool('theme') ?? true;
    }).obs;
    theme.isLightTheme.value = await isLight.value;
    Get.changeThemeMode(
      theme.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
    );
  }

  @override
  void initState() {
    getThemeStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        child: Image.asset("assets/image/logo.png", scale: 3),
        onTap: () {
          Get.offAllNamed('/home');
        },
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              theme.isLightTheme.value
                  ? Icons.wb_sunny_sharp
                  : Icons.nightlight_round_sharp,
              color: theme.isLightTheme.value
                  ? Colors.amber[400]
                  : Colors.blue[400],
            ),
            Container(
              padding: const EdgeInsets.only(right: 5),
              child: Switch(
                  activeColor: Colors.amber[400],
                  activeTrackColor: Colors.amber[200],
                  inactiveThumbColor: Colors.blue[400],
                  inactiveTrackColor: Colors.blue[200],
                  value: theme.isLightTheme.value,
                  onChanged: (x) {
                    setState(() {
                      theme.isLightTheme.value = !theme.isLightTheme.value;
                    });
                    Get.changeThemeMode(
                      theme.isLightTheme.value
                          ? ThemeMode.light
                          : ThemeMode.dark,
                    );
                    saveThemeStatus();
                  }),
            ),
          ],
        )
      ],
    );
  }
}
