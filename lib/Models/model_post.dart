class Post {
  late String profileObjectID;
  late List postMedia = [];
  int? postDate;
  late String description;
  int? numberOfLikes;
  int? numberOfReposts;
  int? numberOfComments;
  List? comments = [];

  Post({
    required this.profileObjectID,
    required this.postMedia,
    this.postDate,
    required this.description,
    this.numberOfLikes,
    this.numberOfReposts,
    this.numberOfComments,
    this.comments,
  });

  Post.fromMap(Map map) {
    postDate = map["postDate"];
    profileObjectID = map["profileObjectID"];
    postMedia = map["postMedia"];
    postDate = map["postDate"];
    description = map["description"];
    numberOfLikes = map["numberOfLikes"];
    numberOfReposts = map["number"];
    numberOfComments = map["numberOfComments"];
    comments = map["comments"];
  }

  Map<String, dynamic> toMap() => {
        "profileObjectID": profileObjectID,
        "postMedia": postMedia,
        "postDate": postDate,
        "description": description,
        "numberOfLikes": numberOfLikes,
        "numberOfReposts": numberOfReposts,
        "numberOfComments": numberOfComments,
        "comments": comments,
      };
}
