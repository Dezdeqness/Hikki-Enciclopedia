import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_collection_entity.dart';
import 'package:result_type/result_type.dart';

abstract class MovieRepository {
  Future<Result<MovieCollectionEntity, HikkiApiException>> getMovies({
    int page,
    String sortBy,
  });
}
