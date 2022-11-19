import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/model_profile.dart';
import 'api_constants.dart';
import 'token.dart';

class ApiService {
  static Future<Profile> createProfile(Profile profile) async {
    final response = await http.post(
      Uri.parse(APIConstants.apiUrl + APIConstants.createProfile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': profile.name,
        'nickname': profile.nickname,
        'email': profile.email,
        'password': profile.password,
        'creationDate': profile.creationDate.toString(),
      }),
    );
    if (response.statusCode == 200) {
      return Profile.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar Perfil');
    }
  }

  static Future<bool> login(String email, String password) async {
    Token token = Get.put(Token());
    final response =
        await http.post(Uri.parse(APIConstants.apiUrl + APIConstants.login),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'email': email,
              'password': password,
            }));
    if (response.statusCode == 200) {
      token.token.value = jsonDecode(response.body)["token"];
      return true;
    } else {
      print("${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao criar Perfil');
    }
  }

  static Future<bool> buscarDadosProfile() async {
    //LUIGGI arruma um name "buscarDadosProfile" melhor ok
    Token token = Get.put(Token());
    final response = await http.get(
      Uri.parse(APIConstants.apiUrl + APIConstants.getProfileByToken),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token.token.value
      },
    );
    if (response.statusCode == 200) {
      print("Resposta: " + response.body);
      return true;
    } else {
      print("${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao sincronizar Perfil');
    }
  }
}
