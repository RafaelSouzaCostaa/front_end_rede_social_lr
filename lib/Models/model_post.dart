import 'dart:ui';

class Post {
  late String user;
  late String userNickName;
  Image? userProfilePicture;
  // List<Image> postImages = [];//ATENCAO CORRIGIR
  int? numberOfLikes;
  int? numberOfReposts;
  int? numberOfComments;

  Post(this.user, this.userNickName, {this.userProfilePicture});
}
