import 'package:get/get.dart';

class Token extends GetxController {
  String? _token;

  Token(token) {
    _token = token;
  }

  get token => _token;

  void apagarToken() {
    _token = null;
  }
}
