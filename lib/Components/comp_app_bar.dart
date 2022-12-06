import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Colors/themes.dart';
import '../Global/shared_preferences.dart';

enum changeLanguage { portuguese, spanish, english }

enum changeTheme { lightThemeMenu, darkThemeMenu }

class ComponentAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ComponentAppBar({super.key});

  @override
  State<ComponentAppBar> createState() => _ComponentAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _ComponentAppBarState extends State<ComponentAppBar> {
  InstanceSharedPreference sharedPreferences = InstanceSharedPreference();
  Themes theme = Get.put(Themes());

  @override
  void initState() {
    sharedPreferences.getThemeStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        child: SizedBox(
          width: 35,
          child: Image.asset("assets/image/logo.png", scale: 3),
        ),
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
            Obx(
              () => (PopupMenuButton<changeTheme>(
                icon: Icon(
                  theme.isLightTheme.value ? Icons.wb_sunny : Icons.dark_mode,
                  color: theme.isLightTheme.value
                      ? Colors.amber.shade200
                      : Colors.blue.shade200,
                ),
                onSelected: (changeTheme item) {
                  setState(() {
                    if (item.name == 'lightThemeMenu') {
                      theme.isLightTheme.value = true;
                      Get.changeThemeMode(ThemeMode.light);
                      sharedPreferences.saveThemeStatus();
                    } else if (item.name == 'darkThemeMenu') {
                      theme.isLightTheme.value = false;
                      Get.changeThemeMode(ThemeMode.dark);
                      sharedPreferences.saveThemeStatus();
                    }
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<changeTheme>>[
                  PopupMenuItem<changeTheme>(
                    value: changeTheme.lightThemeMenu,
                    child: Row(children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.amber.shade100,
                      ),
                      Text("  ${'light'.tr}"),
                    ]),
                  ),
                  PopupMenuItem<changeTheme>(
                    value: changeTheme.darkThemeMenu,
                    child: Row(children: [
                      Icon(
                        Icons.dark_mode,
                        color: Colors.blue.shade100,
                      ),
                      Text("  ${'dark'.tr}"),
                    ]),
                  ),
                ],
              )),
            ),
            //Menu Idioma
            PopupMenuButton<changeLanguage>(
              icon: Icon(
                Icons.flag,
                color: Colors.green.shade200,
              ),
              onSelected: (changeLanguage item) {
                setState(() {
                  if (item.name == 'portuguese') {
                    Get.updateLocale(const Locale('pt', 'BR'));
                  }

                  if (item.name == 'english') {
                    Get.updateLocale(const Locale('en', 'US'));
                  }

                  if (item.name == 'spanish') {
                    Get.updateLocale(const Locale('es', 'ES'));
                  }
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<changeLanguage>>[
                PopupMenuItem<changeLanguage>(
                  value: changeLanguage.english,
                  child: Text('en'.tr,
                      style: TextStyle(color: Colors.blue.shade100)),
                ),
                PopupMenuItem<changeLanguage>(
                  value: changeLanguage.spanish,
                  child: Text('es'.tr,
                      style: TextStyle(color: Colors.red.shade100)),
                ),
                PopupMenuItem<changeLanguage>(
                  value: changeLanguage.portuguese,
                  child: Text('pt'.tr,
                      style: TextStyle(color: Colors.green.shade100)),
                ),
              ],
            ),
            // ),
          ],
        )
      ],
    );
  }
}
