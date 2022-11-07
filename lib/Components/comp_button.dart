// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

class ComponentButton extends StatefulWidget {
  String text;
  Color color;
  Function onPressed;
  double width;
  double height;

  ComponentButton({
    super.key,
    required this.text,
    this.color = Colors.black,
    required this.onPressed,
    this.width = 25,
    this.height = 6,
  });

  @override
  State<ComponentButton> createState() => _ComponentButtonState();
}

class _ComponentButtonState extends State<ComponentButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * 5,
      height: widget.height * 5,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(CustomizedColors.buttonBackground),
        ),
        onPressed: () {
          widget.onPressed();
        },
        child: Text(
          widget.text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: widget.color,
            fontFamily: 'Imprima-Regular',
          ),
        ),
      ),
    );
  }
}
