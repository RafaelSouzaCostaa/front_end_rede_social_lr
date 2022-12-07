import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComponentEditButton extends StatefulWidget {
  IconData? icon;
  Function? onPressed;
  ComponentEditButton({super.key, this.icon, this.onPressed});

  @override
  State<ComponentEditButton> createState() => _ComponentEditButtonState();
}

class _ComponentEditButtonState extends State<ComponentEditButton> {
  @override
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).iconTheme.color!;
    return CircleAvatar(
      backgroundColor: Get.isDarkMode
          ? const Color.fromARGB(40, 0, 0, 0)
          : const Color.fromARGB(60, 116, 116, 116),
      child: Icon(
        widget.icon ?? Icons.edit,
        color: themeColor,
        size: 25,
      ),
    );
  }
}
