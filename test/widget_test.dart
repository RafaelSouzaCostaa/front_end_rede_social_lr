// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Global/api_service.dart';
import 'package:rede_social_lr/Global/token.dart';
import 'package:rede_social_lr/Models/model_profile.dart';

void main() {
  Profile testeProfile = Profile(
      name: "Ryan",
      nickname: "ryanzinho",
      email: "ryan@gmail.com",
      password: "ryan123",
      creationDate: DateTime.now().millisecondsSinceEpoch);
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    Profile testCreate =
        await ApiService.createProfile(testeProfile) as Profile;
    print(testCreate);
    expect(testeProfile, testCreate);
    expect("Ryan", testCreate.name);

    await ApiService.login(testeProfile.email, testeProfile.password);
    expect(true, Get.put(Token()));
    print(testCreate.id);
    var testeDelete = ApiService.deleteProfile(testCreate.id.toString());
    //RAFAEL preciso saber a id do banco pra testar aqui, então seria melhor delete by nickname
    expect(true, testeDelete);
  });
}
