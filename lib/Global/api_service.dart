import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/model_profile.dart';
import 'api_constants.dart';

class ApiService {
  Future<http.Response> createProfile(Profile profile) async {
    return http.post(
      Uri.parse(APIConstants.apiUrl + APIConstants.createProfile),
      body: jsonEncode(<String, String>{
        'name': profile.name,
        'nickname': profile.nickname,
        'email': profile.email,
        'password': profile.password,
      }),
    );
  }
}
