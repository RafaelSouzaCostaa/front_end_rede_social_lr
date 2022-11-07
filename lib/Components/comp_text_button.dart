import 'package:flutter/material.dart';

class ComponentTextButton extends StatefulWidget {
  String text;
  IconData? icon;
  Color textColor;
  Color iconColor;
  Function onPressed;
  MainAxisAlignment mainAxisAlignment;
  num height;
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
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.height = 6,
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
    var screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * (widget.height / 100),
      child: TextButton(
        onPressed: () {
          widget.onPressed();
        },
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: [
            Container(
              padding: EdgeInsets.only(left: widget.leftPadding),
              child: widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: widget.iconColor,
                    )
                  : null,
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
