import 'dart:ui';

class Profile {
  late String name;
  late String nickName;
  late String email;
  late String password;
  Image? profilePicture;
  DateTime? birthDate;

  Profile(this.name, this.nickName, this.email, this.password,
      {this.profilePicture, this.birthDate});
}
