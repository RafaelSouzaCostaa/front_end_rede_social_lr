import 'package:get/get.dart';

class Token extends GetxController {
  late String _token = List.obs; //RAFAEL faz uma lista aqui

  get token => _token;

  void apagarToken() {
    _token = "";
  }
}
