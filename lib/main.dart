import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        //'/': (_) => screen(),
        // '/telab': (context) => TelaB(),
      },
    ),
  );
}

//CUIDADOS AO IMPORTAR ARQUIVOS PROPRIOS, NÃO IMPORTAR COM "PACKAGE:" IMPORTAR DA MANEIRA TRADICIONAL "../PASTA/ARQUIVO.DART",
//ISSO VAI EVITAR UMA GRANDE DOR DE CABEÇA DEPOIS;
