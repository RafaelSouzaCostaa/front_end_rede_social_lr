import 'package:get/get.dart';

class Token extends GetxController {
  late String _token = ""; //RAFAEL faz uma lista aqui

  get token => _token;

  Token(token) {
    print("dentro de token: " + token);
    _token = token;
  }

  void apagarToken() {
    _token = "";
  }
}
