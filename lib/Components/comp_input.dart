// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

class ComponentInput extends StatefulWidget {
  String labelText;
  var suffixIcon;
  double width;
  int minLines;
  int maxLines;
  bool obscureText = false;
  bool validator = false;
  TextEditingController controller;

  ComponentInput({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator = false,
    this.width = 8.5,
    this.minLines = 1,
    this.maxLines = 1,
    required this.controller,
  });

  @override
  State<ComponentInput> createState() => _ComponentInputState();
}

class _ComponentInputState extends State<ComponentInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (widget.width / 10),
      child: TextFormField(
        minLines: widget.obscureText ? 1 : widget.minLines,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        controller: widget.controller,
        style: TextStyle(color: Colors.white70, fontFamily: 'Imprima-Regular'),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          alignLabelWithHint: true,
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 13, color: Colors.white70),
          hintStyle: TextStyle(
            fontSize: 13,
            color: Colors.white24,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: widget.suffixIcon,
          ),
          //Borda Padrão
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(
              color: Colors.grey.shade600,
              width: 0.45,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(
              color: CustomizedColors.inputBorderColor,
              width: 1.2,
            ),
          ),
          //Validator Border
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.45,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
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
