class ApiRoutes {
  static const String baseUrl = "https://caseapi.servicelabs.tech";
  static const String userLogin = "/user/login";
  static const String userProfile = "/user/profile";
  static const String userRegister = "/user/register";
  static const String uploadPhoto = "/user/upload_photo";
  static String setMovieFavorite(String favoriteId) => "/movie/favorite/$favoriteId";
  static const String getFavorites = "/movie/favorites";
  static const String getMovieList = "/movie/list";
}
