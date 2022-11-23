class Post {
  String? nameProfilePost;
  late String profileObjectId;
  late List postMedia = [];
  int? postDate;
  late String description;
  int? numberOfLikes;
  int? numberOfReposts;
  int? numberOfComments;
  List? comments = [];

  Post({
    required this.profileObjectId,
    required this.postMedia,
    this.postDate,
    required this.description,
    this.numberOfLikes,
    this.numberOfReposts,
    this.numberOfComments,
    this.comments,
  });

  Post.fromMap(Map map) {
    nameProfilePost = map["nameProfilePost"];
    postDate = map["postDate"];
    profileObjectId = map["profileObjectId"];
    postMedia = map["postMedia"];
    postDate = map["postDate"];
    description = map["description"];
    numberOfLikes = map["numberOfLikes"];
    numberOfReposts = map["number"];
    numberOfComments = map["numberOfComments"];
    comments = map["comments"];
  }

  Map<String, dynamic> toMap() => {
        "nameProfilePost": nameProfilePost,
        "profileObjectId": profileObjectId,
        "postMedia": postMedia,
        "postDate": postDate,
        "description": description,
        "numberOfLikes": numberOfLikes,
        "numberOfReposts": numberOfReposts,
        "numberOfComments": numberOfComments,
        "comments": comments,
      };
}
