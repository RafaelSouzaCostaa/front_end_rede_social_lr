import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Colors/themes.dart';

import '../Colors/customized_colors_global.dart';

class ComponentAppBar extends StatefulWidget implements PreferredSizeWidget {
  ComponentAppBar({super.key});

  @override
  State<ComponentAppBar> createState() => _ComponentAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _ComponentAppBarState extends State<ComponentAppBar> {
  @override
  Widget build(BuildContext context) {
    Themes theme = Get.put(Themes());
    bool islightTheme = theme.isLightTheme.value;

    return AppBar(
      title: GestureDetector(
        child: Image.asset("assets/image/logo.png", scale: 3),
        onTap: () {
          Get.offAllNamed('/home');
        },
      ),
      centerTitle: true,
      backgroundColor: CustomizedColors.darkBackground,
      automaticallyImplyLeading: true,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: IconButton(
                icon: islightTheme
                    ? Icon(
                        Icons.wb_sunny_sharp,
                        color: Colors.amber[100],
                      )
                    : Icon(
                        Icons.nightlight_round_sharp,
                        color: Colors.blue[100],
                      ),
                onPressed: () {},
              ),
            )
          ],
        )
      ],
    );
  }
}
