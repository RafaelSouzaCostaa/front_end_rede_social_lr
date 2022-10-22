import 'package:flutter/material.dart';

class ComponentInput extends StatefulWidget {
  String labelText;
  Icon? suffixIcon;
  bool obscureText = false;
  // var width;
  // var heigth;
  TextEditingController controller;

  ComponentInput({
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    // this.width = 250,
    // this.heigth = 40,
    required this.controller,
  });

  @override
  _ComponentInputState createState() => _ComponentInputState();
}

class _ComponentInputState extends State<ComponentInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 13), //L
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
