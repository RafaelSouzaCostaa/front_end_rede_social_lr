import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

class ComponentTextButton extends StatefulWidget {
  String text;
  IconData? icon;
  Color textColor;
  Color iconColor;
  Function onPressed;
  MainAxisAlignment mainAxisAlignment;
  num heightPercentage;
  double rightPadding;
  double leftPadding;
  double spaceBetweenIconAndText;

  ComponentTextButton({
    super.key,
    required this.text,
    this.icon,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    required this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.heightPercentage = 0.06,
    this.leftPadding = 5,
    this.rightPadding = 10,
    this.spaceBetweenIconAndText = 8,
  });

  @override
  State<ComponentTextButton> createState() => _ComponentTextButtonState();
}

class _ComponentTextButtonState extends State<ComponentTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: MediaQuery.of(context).size.height * widget.heightPercentage,
      child: TextButton(
        onPressed: () {
          widget.onPressed();
        },
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: [
            Container(
              padding: EdgeInsets.only(left: widget.leftPadding),
              child: Icon(
                widget.icon,
                color: widget.iconColor,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  right: widget.rightPadding,
                  left: widget.spaceBetweenIconAndText),
              child: Text(
                widget.text,
                style: TextStyle(color: widget.textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
