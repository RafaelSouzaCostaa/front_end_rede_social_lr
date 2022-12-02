import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/model_post.dart';
import '../Models/model_profile.dart';
import 'api_constants.dart';
import 'profile_authenticated.dart';
import 'token.dart';

class ApiService {
  static final Token _token = Get.put(Token());
  static final Map<String, String> _headerDefault = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  static final Map<String, String> _headerWithTokenWithTime = {
    'Content-Type': 'application/json; charset=UTF-8',
    'x-access-token': _token.token.value,
    'x-access-time': DateTime.now().millisecondsSinceEpoch.toString()
  };
  //Profile
  static Future<Profile> createProfile(Profile profile) async {
    final response = await http.post(
      Uri.parse(APIConstants.apiUrl + APIConstants.createProfile),
      headers: _headerDefault,
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
      return Profile.defaultGetX();
    }
  }

  static Future<int> login(String email, String password) async {
    final response =
        await http.post(Uri.parse(APIConstants.apiUrl + APIConstants.login),
            headers: _headerDefault,
            body: jsonEncode(<String, String>{
              'email': email,
              'password': password,
            }));

    if (response.statusCode == 404) {
      return 404;
    } else if (response.statusCode == 200) {
      _token.token.value = jsonDecode(response.body)["token"];
      return 200;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      return response.statusCode;
    }
  }

  static Future<bool> getProfileData() async {
    ProfileAuthenticated profileAuthenticated = Get.put(ProfileAuthenticated());
    final response = await http.get(
        Uri.parse(APIConstants.apiUrl + APIConstants.getProfileByToken),
        headers: _headerWithTokenWithTime);
    if (response.statusCode == 200) {
      profileAuthenticated.profileAuthentic.value =
          Profile.fromMap(jsonDecode(response.body));
      return true;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao sincronizar Perfil!');
    }
  }

  static Future<List<Profile>> getAllProfiles() async {
    final response = await http.get(
      Uri.parse(APIConstants.apiUrl + APIConstants.getAllProfiles),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': _token.token.value
      },
    );
    if (response.statusCode == 200) {
      List<Profile> profilesJson = List<Profile>.empty(growable: true);
      var profilesMap = jsonDecode(response.body);

      for (var profile in profilesMap) {
        profilesJson.add(Profile.fromMap(profile));
      }

      return profilesJson;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar perfis');
    }
  }

  static Future<Profile> getProfileByNick(String nickname) async {
    final response = await http.get(
        Uri.parse(
            APIConstants.apiUrl + APIConstants.getProfileByNickname(nickname)),
        headers: _headerWithTokenWithTime);

    if (response.statusCode == 200) {
      return Profile.fromMap(jsonDecode(response.body));
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha recuperar perfil!');
    }
  }

  static Future<bool> deleteProfile(String id) async {
    final response = await http.delete(
        Uri.parse(APIConstants.apiUrl + APIConstants.deleteProfileById(id)),
        headers: _headerWithTokenWithTime);

    if (response.statusCode == 200) {
      return true;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      //throw Exception('Falha ao apagar perfil!');
      return false;
    }
  }

  //Post
  static Future<Post> createPost(String description, List<String> media) async {
    final response = await http.post(
      Uri.parse(APIConstants.apiUrl + APIConstants.createPost),
      headers: _headerWithTokenWithTime,
      body: jsonEncode(
        <String, dynamic>{
          'postMedia': media,
          'postDate': DateTime.now().millisecondsSinceEpoch.toString(),
          'description': description
        },
      ),
    );

    if (response.statusCode == 200) {
      return Post.fromMap(jsonDecode(response.body));
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao fazer postagem!');
    }
  }

  static Future<List<Post>> getAllPosts() async {
    final response = await http.get(
        Uri.parse(APIConstants.apiUrl + APIConstants.getAllPosts),
        headers: _headerWithTokenWithTime);

    if (response.statusCode == 200) {
      List<Post> postsJson = List<Post>.empty(growable: true);
      var postsMap = jsonDecode(response.body);
      postsMap.forEach((post) => {postsJson.add(Post.fromMap(post))});
      return postsJson;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar postagens');
    }
  }

  static Future<List<Post>> getAllPostByFollow() async {
    final response = await http.get(
        Uri.parse(APIConstants.apiUrl + APIConstants.getAllByFollow),
        headers: _headerWithTokenWithTime);

    if (response.statusCode == 200) {
      var postsMap = jsonDecode(response.body);
      List<Post> postsJson = List<Post>.empty(growable: true);

      postsMap.forEach((post) => {postsJson.add(Post.fromMap(post))});
      return postsJson;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar postagens');
    }
  }

  static Future<List<Post>> getAllPostsByProfileId({String? id}) async {
    final response = await http.get(
        Uri.parse(APIConstants.apiUrl + APIConstants.getAllByProfileId(id)),
        headers: _headerWithTokenWithTime);

    if (response.statusCode == 200) {
      var postsMap = jsonDecode(response.body);
      List<Post> postsJson = List<Post>.empty(growable: true);

      postsMap.forEach((post) => {postsJson.add(Post.fromMap(post))});
      return postsJson;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar postagens');
    }
  }
}
