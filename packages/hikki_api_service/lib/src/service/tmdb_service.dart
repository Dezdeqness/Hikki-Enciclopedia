import 'package:hikki_api_service/src/constants/index.dart';
import 'package:hikki_api_service/src/models/index.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'tmdb_service.g.dart';

@RestApi(baseUrl: TMDBConstants.baseUrl)
abstract class TmdbService {
  factory TmdbService(Dio dio, {String baseUrl}) = _TmdbService;

  @GET(TMDBConstants.discoverMovie)
  Future<MovieCollection> getMovies({
    @Query(TMDBConstants.page) int page = 1,
    @Query(TMDBConstants.sortBy) String sortBy = "popularity.desc",
  });

  @GET(TMDBConstants.tvTopRatedPath)
  Future<TvCollection> getTvTopRated({
    @Query(TMDBConstants.page) int page = 1,
  });

  @GET(TMDBConstants.tvPopularPath)
  Future<TvCollection> getTvPopular({
    @Query(TMDBConstants.page) int page = 1,
  });

  @GET(TMDBConstants.tvAiringTodayPath)
  Future<TvCollection> getTvAiringToday({
    @Query(TMDBConstants.page) int page = 1,
  });

  @GET(TMDBConstants.trendingTv)
  Future<TvCollection> getTvTrending({
    @Query(TMDBConstants.page) int page = 1,
    @Path("time_window") String path = TMDBConstants.day,
  });

  @GET(TMDBConstants.tokenNew)
  Future<RequestTokenResponse> getRequestToken();

  @POST(TMDBConstants.sessionNew)
  Future<SessionResponse> getSessionToken(@Body() RequestTokenRequest body);

  @GET(TMDBConstants.tvDetailsPath)
  Future<TvDetailsResponse> getTvDetails({
    @Path("series_id") String seriesId = "1396",
    @Query(TMDBConstants.appendToResponse)
    String append = "similar,recommendations,videos,credits",
  });

  @GET(TMDBConstants.accountPath)
  Future<ProfileResponse> getProfile(
    @Query(TMDBConstants.sessionId)
    String sessionId,
  );

  @GET(TMDBConstants.accountRatedMoviesPath)
  Future<MovieCollection> getRatedMovies({
    @Path("account_id") String accountId = "",
    @Query(TMDBConstants.page) int page = 1,
    @Query(TMDBConstants.sessionId) String sessionId = "",
    @Query(TMDBConstants.sortBy) String sortBy = "created_at.asc"
  });

  @GET(TMDBConstants.accountRatedTvPath)
  Future<TvCollection> getRatedTv({
    @Path("account_id") String accountId = "",
    @Query(TMDBConstants.page) int page = 1,
    @Query(TMDBConstants.sessionId) String sessionId = "",
    @Query(TMDBConstants.sortBy) String sortBy = "created_at.asc"
  });

  @GET(TMDBConstants.accountWatchlistMoviesPath)
  Future<MovieCollection> getWatchlistMovies({
    @Path("account_id") String accountId = "",
    @Query(TMDBConstants.page) int page = 1,
    @Query(TMDBConstants.sessionId) String sessionId = "",
    @Query(TMDBConstants.sortBy) String sortBy = "created_at.asc"
  });

  @GET(TMDBConstants.accountWatchlistTvPath)
  Future<TvCollection> getWatchlistTv({
    @Path("account_id") String accountId = "",
    @Query(TMDBConstants.page) int page = 1,
    @Query(TMDBConstants.sessionId) String sessionId = "",
    @Query(TMDBConstants.sortBy) String sortBy = "created_at.asc"
  });

}
