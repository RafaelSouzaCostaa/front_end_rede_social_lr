import 'dart:ui';

class Post {
  // List<Image> postImages = [];//ATENCAO CORRIGIR
  int? creationDate;

  Post({
    required this.creationDate,
  });

  Post.fromMap(Map map) {
    creationDate = map["creationDate"];
  }

  Map<String, dynamic> toMap() => {
        "creationDate": creationDate,
      };
}
