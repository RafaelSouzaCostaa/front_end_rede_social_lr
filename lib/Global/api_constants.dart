class APIConstants {
  String? nickname;
  String? id;

  APIConstants({this.nickname, this.id});

  static String apiUrl = 'http://177.6.197.232:3000';

  //endpoints
  static String endpointLogin = '/login/';

  static String endpointCreatePost = '/post/create';
  static String endpointGetAllPosts = '/post/getAll';

  static String endpointCreateProfile = '/profile/create';
  static String endpointGetAllProfiles = '/profile/getAll';
  static String endpointGetProfileByNickname =
      '/profile/getByNickname/';//nickname
  static String endpointGetProfileById = '/profile/getById/';//id
  static String endpointDeleteProfileById = '/profile/deleteById/';//id
  static String endpointSetFollowProfile = '/profile/setFollow/';//id

  static String endpointCreateComment = '/comment/create';
  static String endpointCreateSubComment = '/comment/createSubComment';
}
