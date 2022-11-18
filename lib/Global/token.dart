import 'package:get/get.dart';

class Token extends GetxController {
  final List<String> _token = List<String>.empty(growable: true).obs;

  get token => _token;

  Token(token) {
    if(_token.isEmpty){
      _token.add(token);
    }
  }

  void apagarToken() {
    if(_token.isNotEmpty){
      _token.clear();
    }
  }
}
