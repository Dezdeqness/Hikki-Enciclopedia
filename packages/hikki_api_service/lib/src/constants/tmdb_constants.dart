class TMDBConstants {
  // Base urls
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String baseImageUrl = "https://image.tmdb.org/";
  static const String baseMediaUrl = "https://media.themoviedb.org/";
  static const String oauthUrl = "www.themoviedb.org";

  // API paths
  static const String discoverMovie = "discover/movie";
  static const String authentication = "authentication/";
  static const String tokenNew = "${authentication}token/new";
  static const String sessionNew = "${authentication}session/new";
  static const String trending = "trending/";
  static const String trendingTv = "$trending$tvPath{time_window}";
  static const String imagePath = "t/p/w780/";
  static const String mediaPath = "/t/p/w150_and_h150_face/";
  static const String oauthPath = "/authenticate/";
  static const String tvPath = "tv/";
  static const String moviePath = "movie/";
  static const String tvDetailsPath = "${tvPath}{series_id}";
  static const String movieDetailsPath = "${moviePath}{series_id}";
  static const String tvTopRatedPath = "${tvPath}top_rated";
  static const String tvPopularPath = "${tvPath}popular";
  static const String tvAiringTodayPath = "${tvPath}airing_today";
  static const String accountPath = "account";
  static const String ratedPath = "/rated/";
  static const String watchlistPath = "/watchlist/";
  static const String accountMoviePath = "movies";
  static const String accountTvPath = "tv";
  static const String accountRatedMoviesPath = "$accountPath/{account_id}$ratedPath$accountMoviePath";
  static const String accountRatedTvPath = "$accountPath/{account_id}$ratedPath$accountTvPath";
  static const String accountWatchlistMoviesPath = "$accountPath/{account_id}$watchlistPath$accountMoviePath";
  static const String accountWatchlistTvPath = "$accountPath/{account_id}$watchlistPath$accountTvPath";

  // API endpoints params
  static const String language = "language";
  static const String page = "page";
  static const String sortBy = "sort_by";
  static const String apiKey = "api_key";
  static const String redirectTo = "redirect_to";
  static const String day = "day";
  static const String credits = "credits";
  static const String recommendations = "recommendations";
  static const String similar = "similar";
  static const String videos = "videos";
  static const String appendToResponse = "append_to_response";
  static const String sessionId = "session_id";

  static const String youtubePreviewPath = "https://img.youtube.com/vi/";
  static const String youtubePreviewEndPath = "/hqdefault.jpg";
}
