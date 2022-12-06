class Post {
  String? name;
  String? nickname;
  late String? profileObjectId;
  late List<dynamic> postMedia = List<dynamic>.empty(growable: true);
  int? postDate;
  late String description;
  int? numberOfLikes;
  int? numberOfReposts;
  int? numberOfComments;
  String? image;

  List? postLikedBy = [];

  Post({
    required this.postMedia,
    this.postDate,
    required this.description,
    this.numberOfLikes,
    this.numberOfReposts,
    this.numberOfComments,
  });

  Post.fromMap(Map map) {
    name = map["name"];
    postDate = map["postDate"];
    nickname = map["nickname"];
    profileObjectId = map["profileObjectId"];
    postMedia = map["postMedia"];
    postDate = map["postDate"];
    description = map["description"];
    numberOfLikes = map["numberOfLikes"];
    numberOfReposts = map["number"];
    numberOfComments = map["numberOfComments"];
    postLikedBy = map["postLikedBy"];
    image = map["image"];
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "profileObjectId": profileObjectId,
        "nickname": nickname,
        "postMedia": postMedia,
        "postDate": postDate,
        "description": description,
        "numberOfLikes": numberOfLikes,
        "numberOfReposts": numberOfReposts,
        "numberOfComments": numberOfComments,
        "postLikedBy": postLikedBy,
        "image": image,
      };
}
