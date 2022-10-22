import 'package:flutter/material.dart';

class ComponentInput extends StatefulWidget {
  String labelText;
  Icon? suffixIcon;
  bool obscureText = false;
  bool validator = true;
  // var width;
  // var heigth;
  TextEditingController controller;

  ComponentInput({
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator = true,
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
      width: MediaQuery.of(context).size.width * 0.85,
      height: 65,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(fontSize: 13), //L
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
              width: 0.45,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF635959),
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
