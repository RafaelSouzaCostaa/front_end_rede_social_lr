import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

class ComponentAppBar extends StatefulWidget {
  // bool appBarProfilePicture;

  ComponentAppBar({super.key});

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
      // leading: widget.appBarProfilePicture == true
      //     ? Image.asset("")//TODO> Pegar a mesma imagem que está no perfil
      //     : null, 
    );
  }
}
