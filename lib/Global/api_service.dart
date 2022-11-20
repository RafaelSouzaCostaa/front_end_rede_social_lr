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

  //LUIGGI tive que mudar o retorno de bool para int, retornar o statusCode, e tirar o exception, se quiser fazer isso nos outros, fique a vontade
  static Future<int> login(String email, String password) async {
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

    if (response.statusCode == 404) {
      return 404;
    } else if (response.statusCode == 200) {
      token.token.value = jsonDecode(response.body)["token"];
      return 200;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      return response.statusCode;
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
      profileAuthenticated.profileAuthentic.value =
          Profile.fromMap(jsonDecode(response.body));
      //Lembrete pro Luiggi que é burro: salva na variavel global, por isso não retorna ele
      //LUIGGI que isso?! que violencia
      return true;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao sincronizar Perfil!');
    }
  }

  //LUIGGI VALIDADADO = TESTADO RETORNANDO UMA LISTA DE PROFILES
  static Future<List<Profile>> getAllProfiles() async {
    Token token = Get.put(Token());
    final response = await http.get(
      Uri.parse(APIConstants.apiUrl + APIConstants.getAllProfiles),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token.token.value
      },
    );
    if (response.statusCode == 200) {
      List<Profile> profiles = List<Profile>.empty(growable: true);
      var auxResponse = jsonDecode(response.body);

      for (var profile in auxResponse) {
        profiles.add(Profile.fromMap(profile));
      }

      return profiles;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar perfis');
    }
  }

  //LUIGGI testado, tava correto, tinha uma erro mas era no servidor, tava entregando o valor em array e não em formato json
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

  //LUIGGI testado está OK
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
      return true;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao apagar perfil!');
    }
  }

  //LUIGGI testado esta funcionando agora
  static Future<Post> createPost(
      String description, List<String> urlsImage) async {
    Token token = Get.put(Token());
    var auxURLs = [];

    for (var element in urlsImage) {
      {
        auxURLs.add(element);
      }
      ;
    }

    final response = await http.post(
      Uri.parse(APIConstants.apiUrl + APIConstants.createPost),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': token.token.value
      },
      body: jsonEncode(<String, dynamic>{
        'postMedia': auxURLs,
        'postDate': DateTime.now().millisecondsSinceEpoch.toString(),
        'description': description
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

  //LUIGGI testado e funcionando
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
      var auxResponse = jsonDecode(response.body);
      auxResponse.forEach((post) => {posts.add(Post.fromMap(post))});
      return posts;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar postagens');
    }
  }
}
