import 'package:flutter/material.dart';

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
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(40, 0, 0, 0),
        child: Icon(
          widget.icon ?? Icons.edit,
          color: Colors.black,
          size: 25,
        ),
      ),
      onTap: () {
        widget.onPressed;
      },
    );
  }
}
