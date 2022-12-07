import 'package:flutter/material.dart';

class ComponentIconText extends StatefulWidget {
  IconData? icon;
  String? text;
  Function? onPressed;
  Color? iconColor = Colors.grey;
  double? iconSize;
  Color? textColor = Colors.grey;
  Color? iconInactiveColor;
  Color? iconActiveColor;
  Color? textInactiveColor;
  Color? textActiveColor;

  ComponentIconText({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
    this.iconSize = 25,
    this.iconActiveColor = Colors.red,
    this.iconInactiveColor = Colors.grey,
    this.textActiveColor = Colors.red,
    this.textInactiveColor = Colors.grey,
  });

  @override
  State<ComponentIconText> createState() => _ComponentIconTextState();
}

class _ComponentIconTextState extends State<ComponentIconText> {
  @override
  void initState() {
    widget.iconColor = widget.iconInactiveColor;
    widget.textColor = widget.textInactiveColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: widget.iconColor,
                size: widget.iconSize,
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  widget.text!,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            if (widget.iconColor == widget.iconActiveColor) {
              setState(() {
                widget.iconColor = widget.iconInactiveColor;
                widget.textColor = widget.textInactiveColor;
              });
            } else {
              setState(() {
                widget.iconColor = widget.iconActiveColor;
                widget.textColor = widget.textActiveColor;
              });
            }
            widget.onPressed;
          },
        )
      ],
    );
  }
}
