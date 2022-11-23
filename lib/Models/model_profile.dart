import 'dart:ffi';
import 'dart:ui';

class Profile {
  String? id;
  late String name;
  late String nickname;
  late String email;
  late String password;
  String? profileDescription;
  String? description;
  String? phone;
  String? image;
  Image? profilePicture;
  Image? profileBackgroundImage;
  int? birthDate;
  int? creationDate;
  List<dynamic> followingObjectId = List.empty(growable: true);
  List<dynamic> followersObjectId = List.empty(growable: true);

  get getLengthFollowingObjectId => followingObjectId.length;
  get getLengthFollowersObjectId => followersObjectId.length;

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
    description = map["description"];
    phone = map["phone"];
    image = map["image"];
    // profileBackgroundImage = map["profileBackgroundImage"];
    birthDate = map["birthDate"];
    creationDate = map["creationDate"];
    followingObjectId = map["followingObjectId"];
    followersObjectId = map["followersObjectId"];
  }

  Profile.defaultGetX();

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "nickname": nickname,
        "email": email,
        "description": description,
        "password": password,
        "phone": phone,
        "image": image,
        // "profileBackgroundImage": profileBackgroundImage,
        "birthDate": birthDate,
        "creationDate": creationDate,
      };
}
