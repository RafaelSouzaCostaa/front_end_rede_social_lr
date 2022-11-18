import 'dart:ui';

class Profile {
  late String name;
  late String nickName;
  late String email;
  late String password;
  Image? profilePicture;
  DateTime? birthDate;
  DateTime? creationDate;

  Profile({
    required this.name,
    required this.nickName,
    required this.email,
    required this.password,
    this.profilePicture,
    this.birthDate,
  });

  Profile.fromMap(Map map) {
    name = map["name"];
    nickName = map["nickName"];
    email = map["email"];
    password = map["password"];
    // phone = map["phone"];
    // image = map["image"];
    birthDate = map["birthDate"];
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
