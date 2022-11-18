import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/model_profile.dart';
import 'api_constants.dart';

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
}
