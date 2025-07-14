class TMDBConstants {
  // Base urls
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String baseImageUrl = "https://image.tmdb.org/";

  // API paths
  static const String discoverMovie = "discover/movie";
  static const String authentication = "authentication/";
  static const String tokenNew = "${authentication}token/new";
  static const String imagePath = "t/p/w780/";

  // API endpoints params
  static const String language = "language";
  static const String page = "page";
  static const String sortBy = "sort_by";
  static const String apiKey = "api_key";
}
