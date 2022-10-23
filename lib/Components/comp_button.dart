import 'package:flutter/material.dart';
import 'package:rede_social_lr/Colors/customized_colors_grobal.dart';

class ComponentButton extends StatefulWidget {
  String text;
  Color color;
  Function onPressed;
  double widthDouble;
  double? maxWidth;

  ComponentButton(
      {super.key,
      required this.text,
      this.color = Colors.black,
      required this.onPressed,
      this.widthDouble = 0.17,
      this.maxWidth});

  @override
  State<ComponentButton> createState() => _ComponentButtonState();
}

class _ComponentButtonState extends State<ComponentButton> {
  @override
  Widget build(BuildContext context) {
    widget.maxWidth ??= MediaQuery.of(context).size.width * 1;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: widget.maxWidth!,
      ),
      child: SizedBox(
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
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(color: widget.color, fontFamily: 'Imprima-Regular'),
          ),
        ),
      ),
    );
  }
}
