// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

class ComponentAppBar extends StatefulWidget implements PreferredSizeWidget {
  bool hasDrawer;

  ComponentAppBar({super.key, required this.hasDrawer});

  @override
  State<ComponentAppBar> createState() => _ComponentAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _ComponentAppBarState extends State<ComponentAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        child: Image.asset("assets/image/logo.png", scale: 3),
        onTap: () {
          Navigator.pushNamed(context, "/home");
        },
      ),
      centerTitle: true,
      backgroundColor: CustomizedColors.darkBackground,
      automaticallyImplyLeading: true,
      leading: widget.hasDrawer == true
          ? TextButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: const SizedBox(
                width: 30,
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage("assets/image/perfil.png"),
                  //IMPLEMENTAR Imagem de Perfil (image == null ? : ,)
                ),
              ),
            )
          : null,
    );
  }
}
