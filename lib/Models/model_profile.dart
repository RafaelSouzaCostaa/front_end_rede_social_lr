import 'dart:ui';

class Profile {
  String? id;
  late String name;
  late String nickname;
  late String email;
  late String password;
  String? phone;
  String? image;
  Image? profilePicture;
  int? birthDate;
  int? creationDate;

  Profile({
    this.id,
    required this.name,
    required this.nickname,
    required this.email,
    required this.password,
    required this.creationDate,
    this.birthDate,
    this.profilePicture,
  });

  Profile.fromMap(Map map) {
    id = map["_id"];
    name = map["name"];
    nickname = map["nickname"];
    email = map["email"];
    phone = map["phone"];
    image = map["image"];
    birthDate = map["birthDate"];
    creationDate = map["creationDate"];
  }

  Profile.defaultGetX();

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "nickname": nickname,
        "email": email,
        "password": password,
        "phone": phone,
        "image": image,
        "birthDate": birthDate,
        "creationDate": creationDate,
      };
}
