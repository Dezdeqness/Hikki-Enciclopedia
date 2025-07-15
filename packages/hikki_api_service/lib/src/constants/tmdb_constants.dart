class TMDBConstants {
  // Base urls
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String baseImageUrl = "https://image.tmdb.org/";
  static const String oauthUrl = "www.themoviedb.org";

  // API paths
  static const String discoverMovie = "discover/movie";
  static const String authentication = "authentication/";
  static const String tokenNew = "${authentication}token/new";
  static const String sessionNew = "${authentication}session/new";
  static const String imagePath = "t/p/w780/";
  static const String oauthPath = "/authenticate/";

  // API endpoints params
  static const String language = "language";
  static const String page = "page";
  static const String sortBy = "sort_by";
  static const String apiKey = "api_key";
  static const String redirectTo = "redirect_to";
}
