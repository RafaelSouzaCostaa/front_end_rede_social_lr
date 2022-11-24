// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Colors/customized_colors_global.dart';

class ComponentInput extends StatefulWidget {
  String? labelText;
  String? hintText;
  TextEditingController controller;
  double fontSize;
  var suffixIcon;
  double width;
  int minLines;
  int maxLines;
  int? maxLenght;
  bool validator = false;
  bool obscureText = false;
  Color? focusedBorderColor;
  Color? unfocusedBorderColor;

  ComponentInput({
    super.key,
    this.labelText,
    required this.controller,
    this.hintText,
    this.fontSize = 13,
    this.suffixIcon,
    this.maxLenght = 35,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator = false,
    this.obscureText = false,
    this.width = 8.5,
    this.focusedBorderColor,
    this.unfocusedBorderColor,
  });

  @override
  State<ComponentInput> createState() => _ComponentInputState();
}

class _ComponentInputState extends State<ComponentInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * (widget.width / 10),
      child: TextFormField(
        //miscelaneous
        controller: widget.controller,
        obscureText: widget.obscureText,
        //tamanho
        maxLength: widget.maxLenght,
        minLines: widget.obscureText ? 1 : widget.minLines,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        //Style Text
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Imprima-Regular',
          fontSize: widget.fontSize,
        ),

        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignLabelWithHint: true,
          hintText: widget.hintText,
          labelText: widget.labelText,
          //Style
          labelStyle: TextStyle(
            fontSize: widget.fontSize,
            color: Colors.white70,
          ),
          hintStyle: TextStyle(
            fontSize: widget.fontSize,
            color: Colors.white60,
          ),
          counterStyle: TextStyle(
            color: widget.maxLenght! >= 100
                ? CustomizedColors.blueText
                : Colors.transparent,
          ),
          suffixIcon: widget.suffixIcon == null
              ? null
              : Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  child: widget.suffixIcon,
                ),
          //Borda Padrão
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(
              color: widget.unfocusedBorderColor ?? Colors.grey.shade600,
              width: 0.45,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(
              color: widget.focusedBorderColor ??
                  CustomizedColors.lightGreyBorderColor,
              width: 1.2,
            ),
          ),
          //Borda do Validador
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.45,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.2,
            ),
          ),
        ),
        validator: widget.validator == true
            ? (value) {
                if (value!.isEmpty) {
                  return "Campo Obrigatorio";
                }
                return null;
              }
            : null,
      ),
    );
  }
}
