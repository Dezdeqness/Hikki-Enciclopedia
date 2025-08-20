import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_collection_entity.dart';
import 'package:result_type/result_type.dart';

abstract class PersonalRepository {
  Future<Result<TvCollectionEntity, HikkiApiException>> getRatedTv({
    int page,
  });
  Future<Result<MovieCollectionEntity, HikkiApiException>> getRatedMovies({
    int page,
  });
  Future<Result<TvCollectionEntity, HikkiApiException>> getWatchlistTv({
    int page,
  });
  Future<Result<MovieCollectionEntity, HikkiApiException>> getWatchlistMovies({
    int page,
  });
}
