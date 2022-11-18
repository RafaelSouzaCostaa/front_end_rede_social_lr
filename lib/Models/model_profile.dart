import 'dart:ui';

class Profile {
  late String name;
  late String nickName;
  late String email;
  late String password;
  Image? profilePicture;
  int? birthDate;
  int? creationDate;

  Profile({
    required this.name,
    required this.nickName,
    required this.email,
    required this.password,
    required this.creationDate,
    this.birthDate,
    this.profilePicture,
  });

  Profile.fromMap(Map map) {
    name = map["name"];
    nickName = map["nickName"];
    email = map["email"];
    password = map["password"];
    // phone = map["phone"];
    // image = map["image"];
    birthDate = map["birthDate"];
    creationDate = map["creationDate"];
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "nickName": nickName,
        "email": email,
        "password": password,
        // "phone": phone,
        // "image": image,
        "birthDate": birthDate,
        "creationDate": creationDate,
      };
}
