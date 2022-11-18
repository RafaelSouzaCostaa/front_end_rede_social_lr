import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/model_profile.dart';
import 'api_constants.dart';

class ApiService {
  static Future<Profile> createProfile(Profile profile) async {
    print(jsonEncode(<String, String>{
      'name': profile.name,
      'nickname': profile.nickname,
      'email': profile.email,
      'password': profile.password,
    }));
    final response = await http.post(
      Uri.parse(APIConstants.apiUrl + APIConstants.createProfile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': profile.name,
        'nickName': profile.nickname,
        'email': profile.email,
        'password': profile.password,
        //LUIGGI 'creationDate': Date.now(),
      }),
    );

    if (response.statusCode == 201) {
      return Profile.fromMap(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Falha ao criar Perfil');
    }
  }
}
