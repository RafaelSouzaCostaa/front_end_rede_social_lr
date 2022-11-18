import 'dart:ui';

class Profile {
  late String name;
  late String nickname;
  late String email;
  late String password;
  Image? profilePicture;
  int? birthDate;
  int? creationDate;

  Profile({
    required this.name,
    required this.nickname,
    required this.email,
    required this.password,
    required this.creationDate,
    this.birthDate,
    this.profilePicture,
  });

  Profile.fromMap(Map map) {
    name = map["name"];
    nickname = map["nickname"];
    email = map["email"];
    password = map["password"]; //LUIGGI erro aqui
    // phone = map["phone"];
    // image = map["image"];
    birthDate = map["birthDate"];
    creationDate = map["creationDate"];
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "nickname": nickname,
        "email": email,
        "password": password,
        // "phone": phone,
        // "image": image,
        "birthDate": birthDate,
        "creationDate": creationDate,
      };
}
