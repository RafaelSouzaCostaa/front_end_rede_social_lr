import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/model_post.dart';
import '../Models/model_profile.dart';
import 'api_constants.dart';
import 'profile_authenticated.dart';
import 'token.dart';

class ApiService {
  //Profile
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
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
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
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha realizar Login, confira seus dados!');
    }
  }

  static Future<bool> getProfileData() async {
    Token token = Get.put(Token());
    ProfileAuthenticated profileAuthenticated = Get.put(ProfileAuthenticated());
    final response = await http.get(
      Uri.parse(APIConstants.apiUrl + APIConstants.getProfileByToken),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token.token.value
      },
    );
    if (response.statusCode == 200) {
      profileAuthenticated.profile = response.body;
      //Lembrete pro Luiggi que é burro: salva na variavel global, por isso não retorna ele
      return true;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao sincronizar Perfil!');
    }
  }

//Testar
  static Future<List<Profile>> getAllProfiles() async {
    Token token = Get.put(Token());
    final response = await http.get(
      Uri.parse(APIConstants.apiUrl + APIConstants.getAllPosts),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token.token.value
      },
    );
    if (response.statusCode == 200) {
      List<Profile> profiles = List<Profile>.empty(growable: true);
      profiles.add(Profile.fromMap(jsonDecode(response.body)));
      return profiles;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar perfis');
    }
  }

  static Future<Profile> getProfileByNick(String nickname) async {
    Token token = Get.put(Token());
    final response = await http.get(
      Uri.parse(
          APIConstants.apiUrl + APIConstants.getProfileByNickname(nickname)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token.token.value
      },
    );

    if (response.statusCode == 200) {
      return Profile.fromMap(jsonDecode(response.body));
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha recuperar perfil!');
    }
  }

//Testar
  static Future<bool> deleteProfile(String id) async {
    Token token = Get.put(Token());
    final response = await http.delete(
      Uri.parse(APIConstants.apiUrl + APIConstants.deleteProfileById(id)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token.token.value
      },
    );

    if (response.statusCode == 200) {
      //RAFAEL verifica se aqui volta 200 mesmo pra delete
      return true;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao apagar perfil!');
    }
  }

//Posts
//Testar
  static Future<Post> createPost(Post post) async {
    Token token = Get.put(Token());
    final response = await http.post(
      Uri.parse(APIConstants.apiUrl + APIConstants.createPost),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token.token.value
      },
      body: jsonEncode(<String, String>{
        'postDate': post.creationDate.toString(),
      }),
    );
    if (response.statusCode == 200) {
      return Post.fromMap(jsonDecode(response.body));
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao fazer postagem!');
    }
  }

//Testar
  static Future<List<Post>> getAllPosts() async {
    Token token = Get.put(Token());
    final response = await http.get(
      Uri.parse(APIConstants.apiUrl + APIConstants.getAllPosts),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token.token.value
      },
    );
    if (response.statusCode == 200) {
      List<Post> posts = List<Post>.empty(growable: true);
      posts.add(Post.fromMap(jsonDecode(response.body)));
      return posts;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar postagens');
    }
  }
}
