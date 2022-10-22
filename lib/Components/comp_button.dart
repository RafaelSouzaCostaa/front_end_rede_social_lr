import 'package:flutter/material.dart';

class CompBotao extends StatelessWidget {
  String nome;

  CompBotao({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(const Color(0xFF26F4E8)),
      ),
      onPressed: () {/*IMPLEMENTAÇÃO NA CHAMADA COM GESTURE DETECTOR*/},
      child: Text(
        nome,
        style:
            const TextStyle(color: Colors.black, fontFamily: 'Imprima-Regular'),
      ),
    );
  }
}
