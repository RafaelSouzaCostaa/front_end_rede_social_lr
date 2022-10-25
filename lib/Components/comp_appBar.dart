// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

class ComponentAppBar extends StatefulWidget {
  bool hasDrawer;

  ComponentAppBar({super.key, required this.hasDrawer});

  @override
  State<ComponentAppBar> createState() => _ComponentAppBarState();
}

class _ComponentAppBarState extends State<ComponentAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset("assets/image/logo.png", scale: 3),
      centerTitle: true,
      backgroundColor: CustomizedColors.darkBackground,
      automaticallyImplyLeading: true,
      leading: widget.hasDrawer == true
          ? TextButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: const SizedBox(
                width: 38,
                //Image.asset("")//TODO> Pegar a mesma imagem que está no perfil
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                  size: 18,
                ),
              ))
          : null,
    );
  }
}
