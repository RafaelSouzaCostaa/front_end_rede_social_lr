// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Colors/customized_colors_global.dart';
import 'comp_input.dart';

class ComponentOpenInputButton extends StatefulWidget {
  String? text;
  String? subText;
  IconData? icon;
  Color? textColor;
  Color? iconColor;
  Function onPressed;
  MainAxisAlignment mainAxisAlignment;
  num height;
  double rightPadding;
  double leftPadding;
  double spaceBetweenIconAndText;
  bool hoverAnimation;
  String? inputHintText;
  TextEditingController inputCotroller;

  ComponentOpenInputButton({
    super.key,
    this.text,
    this.subText,
    this.icon,
    this.iconColor,
    this.textColor,
    required this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.height = 7,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.spaceBetweenIconAndText = 8,
    this.hoverAnimation = true,
    this.inputHintText,
    required this.inputCotroller,
  });

  @override
  State<ComponentOpenInputButton> createState() =>
      _ComponentOpenInputButtonState();
}

class _ComponentOpenInputButtonState extends State<ComponentOpenInputButton> {
  bool input = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return SizedBox(
      width: Get.width * 0.98,
      child: Flexible(
        child: TextButton(
          style: !widget.hoverAnimation
              ? TextButton.styleFrom(foregroundColor: backgroundColor)
              : null,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: widget.icon != null
                        ? Icon(
                            widget.icon,
                            color: widget.iconColor,
                          )
                        : null,
                  ),
                  if (widget.text != null)
                    Container(
                      width: Get.width * 0.5,
                      padding: EdgeInsets.only(
                        right: widget.rightPadding,
                        left: widget.spaceBetweenIconAndText,
                      ),
                      child: Text(
                        widget.text.toString(),
                        style:
                            TextStyle(color: widget.textColor, fontSize: 15.5),
                      ),
                    ),
                ],
              ),
              if (widget.subText != null && !input)
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 32, top: 3),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    widget.subText.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              if (input)
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: ComponentInput(
                    controller: widget.inputCotroller,
                    hintText: widget.inputHintText,
                  ),
                )
            ],
          ),
          onPressed: () {
            setState(() {
              if (widget.inputCotroller.text == widget.subText) {
                input = !input;
              }
            });
          },
        ),
      ),
    );
  }
}
