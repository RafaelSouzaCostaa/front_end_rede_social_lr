import 'package:flutter/material.dart';

class ComponentText extends StatefulWidget {
  double fontSize;
  TextOverflow overflow;
  int maxLines;
  String? text;
  Color? color;

  ComponentText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.color,
  });

  @override
  State<ComponentText> createState() => _ComponentTextState();
}

class _ComponentTextState extends State<ComponentText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.toString(),
      style: TextStyle(
        fontSize: widget.fontSize,
        fontFamily: 'Imprima-Regular',
        overflow: widget.overflow,
        color: widget.color,
      ),
      maxLines: 1,
    );
  }
}
