import 'package:flutter/material.dart';

class ComponentButton extends StatefulWidget {
  String text;
  Color color;

  ComponentButton({super.key, required this.text, this.color = Colors.black});

  @override
  State<ComponentButton> createState() => _ComponentButtonState();
}

class _ComponentButtonState extends State<ComponentButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(188, 38, 244, 234)),
      ),
      onPressed: () {/*IMPLEMENTAÇÃO NA CHAMADA COM GESTURE DETECTOR*/},
      child: Text(
        widget.text,
        style: TextStyle(color: widget.color, fontFamily: 'Imprima-Regular'),
      ),
    );
  }
}