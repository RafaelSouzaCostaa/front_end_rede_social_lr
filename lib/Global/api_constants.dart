class APIConstants {
  static String apiUrl = 'http://177.5.66.120:3000';

  //endpoints
  static String login = '/login/';

  static String createPost = '/post/create';
  static String getAllPosts = '/post/getAll';
  static String getAllByFollow = '/post/getAllByFollow';
  static String getAllByProfileId(id) {
    if (id != null) {
      return '/post/getAllByProfileId/$id';
    } else {
      return '/post/getAllByProfileId/null';
    }
  }

  static String createProfile = '/profile/create';
  static String getAllProfiles = '/profile/getAll';
  static String getProfileByToken = '/profile/getProfileByToken';

  static String getProfileByNickname(nickname) {
    return '/profile/getByNickname/$nickname';
  }

  static String getProfileById(id) {
    return '/profile/getById/$id';
  }

  static String deleteProfileById(id) {
    return '/profile/deleteById/$id';
  }

  static String setFollowProfile(id) {
    return '/profile/setFollow/$id';
  }

  static String createComment = '/comment/create';
  static String createSubComment = '/comment/createSubComment';
}
