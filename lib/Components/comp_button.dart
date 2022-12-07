// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../Colors/customized_colors_global.dart';

class ComponentButton extends StatefulWidget {
  String text;
  Function onPressed;
  double width;
  double height;
  TextStyle? textStyle;

  ComponentButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 90,
    this.height = 30,
    this.textStyle,
  });

  @override
  State<ComponentButton> createState() => _ComponentButtonState();
}

class _ComponentButtonState extends State<ComponentButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(CustomizedColors.blueBackground),
        ),
        child: Text(
          widget.text,
          overflow: TextOverflow.ellipsis,
          style: widget.textStyle ??
              const TextStyle(
                color: Colors.black,
                fontFamily: 'Imprima-Regular',
                fontWeight: FontWeight.bold,
              ),
        ),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
