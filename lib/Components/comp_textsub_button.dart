// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Colors/customized_colors_global.dart';

class ComponentTextButtonWithSubtext extends StatefulWidget {
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

  ComponentTextButtonWithSubtext({
    super.key,
    this.text,
    this.subText,
    this.icon,
    this.iconColor,
    this.textColor,
    required this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.height = 6,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.spaceBetweenIconAndText = 8,
    this.hoverAnimation = true,
  });

  @override
  State<ComponentTextButtonWithSubtext> createState() => _ComponentTextButtonWithSubtextState();
}

class _ComponentTextButtonWithSubtextState extends State<ComponentTextButtonWithSubtext> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = Get.height;

    return SizedBox(
      height: screenHeight * (widget.height / 100),
      child: TextButton(
        style: widget.hoverAnimation
            ? null
            : TextButton.styleFrom(
                foregroundColor: Get.isDarkMode
                    ? CustomizedColors.darkBackground
                    : Colors.white,
              ),
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: [
            Column(
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
              ],
            ),
            Container(
              color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    children: [
                      if (widget.text != null)
                        Container(
                          color: Colors.pink,
                          padding: EdgeInsets.only(
                            right: widget.rightPadding,
                            left: widget.spaceBetweenIconAndText,
                          ),
                          child: Text(
                            widget.text.toString(),
                            style: TextStyle(
                              color: widget.textColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        // widget.subText != null
                        //     ? Container(
                        //         color: Colors.green,
                        //         padding: EdgeInsets.only(
                        //           right: widget.rightPadding,
                        //           left: widget.spaceBetweenIconAndText,
                        //         ),
                        //         child: Text(
                        //           widget.subText.toString(),
                        //           style: const TextStyle(
                        //             color: Colors.grey,
                        //           ),
                        //         ),
                        //       )
                        //     : Container(),
                        if (widget.subText != null)
                          Container(
                            color: Colors.green,
                            padding: EdgeInsets.only(
                              right: widget.rightPadding,
                              left: widget.spaceBetweenIconAndText,
                            ),
                            child: Text(
                              widget.subText.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
