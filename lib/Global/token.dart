import 'package:get/get.dart';

class Token extends GetxController {
  RxString token = "".obs;

  deleteToken() {
    token = "".obs;
  }
}
