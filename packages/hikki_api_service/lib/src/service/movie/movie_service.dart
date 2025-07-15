import 'package:hikki_api_service/src/constants/index.dart';
import 'package:hikki_api_service/src/models/index.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: TMDBConstants.baseUrl)
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET(TMDBConstants.discoverMovie)
  Future<MovieCollection> getMovies({
    @Query(TMDBConstants.page) int page = 1,
    @Query(TMDBConstants.sortBy) String sortBy = "popularity.desc",
  });

  @GET(TMDBConstants.tokenNew)
  Future<RequestTokenResponse> getRequestToken();

  @POST(TMDBConstants.sessionNew)
  Future<SessionResponse> getSessionToken(@Body() RequestTokenRequest body);
}
