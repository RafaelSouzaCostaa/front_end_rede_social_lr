import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Colors/themes.dart';
import '../Global/shared_preferences.dart';

class ComponentAppBar extends StatefulWidget implements PreferredSizeWidget {
  Function? onTap;

  ComponentAppBar({super.key, this.onTap});

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
        onTap: widget.onTap == null
            ? () {
                widget.onTap;
              }
            : () {
                Get.offAllNamed('/home');
              },
        child: SizedBox(
          width: 35,
          child: Image.asset("assets/image/logo.png", scale: 3),
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
    );
  }
}
