import 'package:flutter/material.dart';

class ComponentInput extends StatefulWidget {
  String labelText;
  Icon? suffixIcon;
  bool obscureText = false;
  bool validator = true;
  TextEditingController controller;

  ComponentInput({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator = true,
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
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 13, color: Colors.white60),
          hintStyle: TextStyle(fontSize: 13, color: Colors.white24),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.shade600,
              width: 0.45,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
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
