import 'dart:ui';

class Profile {
  String? id;
  late String name;
  late String nickname;
  late String email;
  late String password;
  String? profileDescription;
  String? phone;
  String? image;
  Image? profilePicture;
  Image? profileBackgroundImage;
  int? birthDate;
  int? creationDate;

  Profile({
    this.id,
    required this.name,
    required this.nickname,
    required this.email,
    required this.password,
    required this.creationDate,
    this.profileDescription,
    this.birthDate,
    this.profilePicture,
    this.profileBackgroundImage,
  });

  Profile.fromMap(Map map) {
    id = map["_id"];
    name = map["name"];
    nickname = map["nickname"];
    email = map["email"];
    // profileDescription = map["profileDescription"];
    phone = map["phone"];
    image = map["image"];
    // profileBackgroundImage = map["profileBackgroundImage"];
    birthDate = map["birthDate"];
    creationDate = map["creationDate"];
  }

  Profile.defaultGetX();

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "nickname": nickname,
        "email": email,
        // "profileDescription": profileDescription,
        "password": password,
        "phone": phone,
        "image": image,
        // "profileBackgroundImage": profileBackgroundImage,
        "birthDate": birthDate,
        "creationDate": creationDate,
      };
}
