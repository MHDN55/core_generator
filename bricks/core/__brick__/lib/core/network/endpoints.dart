class Endpoints {
  Endpoints._();

  static String baseUrl = 'http://192.168.1.5:8080/api/';
  static const String register = 'auth/register'; // post
  static const String login = 'auth/login'; // Post
  static const String logout = 'auth/logout'; // post
  static const String changePassword = 'auth/change-password'; // post
  static const String offerings = 'offerings'; // post and get
  static String getOfferingById({required String id}) => 'offerings/$id';
  static String updateOfferingById({required String id}) =>
      'offerings/$id'; // put
  static String deleteOfferingById({required String id}) =>
      'offerings/$id'; // delete
  static String getOfferingByOwnerId({required String id}) =>
      'owners/$id/offerings';
  static const String getOffersByCurrentUser = 'users/offerings';
  // Posts
  static const String createPost = 'posts';
  static const String getPosts = 'posts';
  static String getPostById({required String id}) => 'posts/$id';
  static String updateById({required String id}) => 'posts/$id';
  static String deleteById({required String id}) => 'posts/$id';
  static String getPostByOwnerId({required String id}) =>
      'owners/$id/posts'; // get
  static const String getPostsByCurrentUser = 'users/posts'; // get
  static String getPfferingsPostById({required String id}) =>
      'offerings/$id/posts'; // get
  // Comments
  static String addComment({required String id}) =>
      'posts/$id/comments'; // post
  static String addReplyToComment({required String id}) =>
      'comments/$id/replies'; // post
  static String updateComment({required String id}) => 'comments/$id'; // put
  static String deleteComment({required String id}) => 'comments/$id'; // delete
  static String getCommentsByPostId({required String id}) =>
      'posts/$id/comments'; // get
  static String getCommentDetails({required String id}) => 'comments/$id';
  // Rates
  static String addRate({required String id}) => 'posts/$id/ratings'; // post
  static String getAverageRateByProduct({required String id}) =>
      'products/$id/ratings/average'; // get
  static String getUserRateForProduct({required String id}) =>
      '/products/$id/ratings/me'; // get
  static String ratePost({required String id}) => 'posts/$id/ratings'; // Post
  static String getAveragePostRate({required String id}) =>
      'posts/$id/ratings/average'; // get
  static String getUserRateForPost({required String id}) =>
      'posts/$id/ratings/me'; // get
  static String rateComment({required String id}) =>
      'comments/$id/ratings'; // Post
  static String getAverageCommentRate({required String id}) =>
      'comments/$id/ratings/average'; // get
  static String getUserRateForComment({required String id}) =>
      'comments/$id/ratings/me'; // get

  static String rateOffer({required String id}) =>
      'offerings/$id/ratings'; //post

  static String getOffersRatings({required String id}) =>
      'offerings/$id/ratings'; //get

  static String getUserRateForOffer({required String id}) =>
      'users/offerings/$id/ratings'; //get


  static String getAverageOfferRate({required String id}) =>
      'offerings/$id/ratings/average'; //get
}
