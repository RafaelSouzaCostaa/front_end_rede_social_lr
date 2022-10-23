import 'package:flutter/material.dart';
import 'package:rede_social_lr/Colors/customized_colors_grobal.dart';

class ComponentButton extends StatefulWidget {
  String text;
  Color color;
  Function onPressed;
  double widthDouble;

  ComponentButton(
      {super.key,
      required this.text,
      this.color = Colors.black,
      required this.onPressed,
      this.widthDouble = 0.15});

  @override
  State<ComponentButton> createState() => _ComponentButtonState();
}

class _ComponentButtonState extends State<ComponentButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widget.widthDouble,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(CustomizedColors.buttonBackground),
        ),
        onPressed: () {
          widget.onPressed();
        },
        child: Text(
          widget.text,
          style: TextStyle(color: widget.color, fontFamily: 'Imprima-Regular'),
        ),
      ),
    );
  }
}
