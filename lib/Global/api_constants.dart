class APIConstants {
  //static String apiUrl = 'http://177.6.193.211:3000';//Rafael Casa
  // static String apiUrl = 'http://192.168.0.198:3000';//Rafael Roteador
  static String apiUrl = 'http://10.0.0.105:3000'; //Luiggi Casa

  //endpoints
  static String login = '/login';

  //Profile
  static String createProfile = '/profile/create';

  static String getAllProfiles = '/profile/getAll';
  static String getProfileByToken = '/profile/getProfileByToken';
  static String getProfileById(id) {
    return '/profile/getById/$id';
  }

  static String getProfileByNickname(nickname) {
    return '/profile/getByNickname/$nickname';
  }

  static String followProfile(id) {
    return '/profile/follow/$id';
  }

  static String updateProfile = '/profile/update';

  static String deleteProfileById(id) {
    return '/profile/deleteById/$id';
  }

  //Posts
  static String createPost = '/post/create';
  static String likePost = '/post/like';
  static String getAllPosts = '/post/getAll';
  static String getAllByFollow = '/post/getAllByFollow';

  static String getAllByProfileId(id) {
    if (id != null) {
      return '/post/getAllByProfileId/$id';
    } else {
      return '/post/getAllByProfileId/null';
    }
  }

  static String deletePostById(postId) {
    return '/post/deleteById/$postId';
  }

  //Comments
  static String createComment(profileId) {
    return '/comment/create/$profileId';
  }

  static String createSubComment(profileId) {
    return '/comment/createSubComment/$profileId';
  }

  static String deleteCommentById(profileId, commentId) {
    return '/comment/deleteById/$profileId/$commentId';
  }

  static String deleteSubCommentById(profileId, commentId, subCommentId) {
    return '/comment/deleteSubComment/$profileId/$commentId/$subCommentId';
  }
}
