import 'package:hikki_api_service/src/models/index.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET("discover/movie")
  Future<MovieCollection> getMovies({
    @Query("page") int page = 1,
    @Query("sort_by") String sortBy = "popularity.desc",
  });
}
