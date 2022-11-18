import 'package:get/get.dart';

class TokenController extends GetxController {
  late String _token;

  get token => _token;

  void criarToken() {}

  void apagarToken() {
    _token = "";
  }

  void verificarToken(){
    //não precisa disso, só implementar um singleton na criação do token
  }
}
