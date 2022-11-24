import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Colors/themes.dart';

import '../Colors/customized_colors_global.dart';

class ComponentAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ComponentAppBar({super.key});

  @override
  State<ComponentAppBar> createState() => _ComponentAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _ComponentAppBarState extends State<ComponentAppBar> {
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // _saveThemeStatus() async {
  //   SharedPreferences pref = await _prefs;
  //   pref.setBool('theme', _isLightTheme.value);
  // }

  // _getThemeStatus() async {
  //   var _isLight = _prefs.then((SharedPreferences prefs) {
  //     return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  //   }).obs;
  //   _isLightTheme.value = await _isLight.value;
  //   Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    Themes theme = Get.put(Themes());

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
            Container(
              padding: const EdgeInsets.only(left: 15),
              // child: IconButton(
              //   icon: theme.isLightTheme.value
              //       ? Icon(
              //           Icons.wb_sunny_sharp,
              //           color: Colors.amber[200],
              //         )
              //       : Icon(
              //           Icons.nightlight_round_sharp,
              //           color: Colors.blue[200],
              //         ),
              //   onPressed: () {},
              // ),
              child: Switch(
                  activeTrackColor: Colors.amber[200],
                  activeColor: Colors.amber[400],
                  inactiveTrackColor: Colors.blue[200],
                  inactiveThumbColor: Colors.blue[400],
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
                  }),
            )
          ],
        )
      ],
    );
  }
}
