class APIConstants {
  static String apiUrl = 'http://177.6.197.232:3000';

  //endpoints
  static String login = '/login/';

  static String createPost = '/post/create';
  static String getAllPosts = '/post/getAll';

  static String createProfile = '/profile/create';
  static String getAllProfiles = '/profile/getAll';
  static String getProfileByNickname(nickname){
    return '/profile/getByNickname/$nickname';
  }
  static String getProfileById(id){
    return '/profile/getById/$id';
  } 
  static String deleteProfileById(id){
    return '/profile/deleteById/$id';
  }
  static String setFollowProfile(id){
    return '/profile/setFollow/$id';
  }

  static String createComment = '/comment/create';
  static String createSubComment = '/comment/createSubComment';
}
