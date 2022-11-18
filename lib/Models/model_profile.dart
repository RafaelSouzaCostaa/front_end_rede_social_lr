import 'dart:ui';

class Profile {
  late String name;
  late String nickname;
  late String email;
  late String password;
  Image? profilePicture;
  DateTime? birthDate;
  DateTime? creationDate;

  Profile({
    required this.name,
    required this.nickname,
    required this.email,
    required this.password,
    this.profilePicture,
    this.birthDate,
  });

  Profile.fromMap(Map map) {
    name = map["name"];
    nickname = map["nickname"];
    email = map["email"];
    password = map["password"];
    // phone = map["phone"];
    // image = map["image"];
    birthDate = map["birthDate"];
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
