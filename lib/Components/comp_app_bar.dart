import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Components/comp_theme_button.dart';

import '../Colors/themes.dart';
import '../Global/shared_preferences.dart';

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
          children: const [
            ComponentThemeButton(),
          ],
        )
      ],
    );
  }
}
