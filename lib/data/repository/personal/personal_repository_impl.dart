import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/personal_remote_datasource.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/repository/personal/personal_repository.dart';
import 'package:result_type/result_type.dart';

class PersonalRepositoryImpl implements PersonalRepository {
  final PersonalRemoteDatasource _personalRemoteDatasource;

  PersonalRepositoryImpl(this._personalRemoteDatasource);

  @override
  Future<Result<MovieCollectionEntity, HikkiApiException>> getRatedMovies({int page = 1}) =>
      _personalRemoteDatasource.getRatedMovies(page: page);

  @override
  Future<Result<TvCollectionEntity, HikkiApiException>> getRatedTv({int page = 1}) =>
      _personalRemoteDatasource.getRatedTv(page: page);

  @override
  Future<Result<MovieCollectionEntity, HikkiApiException>> getWatchlistMovies({int page = 1}) =>
      _personalRemoteDatasource.getWatchlistMovies(page: page);

  @override
  Future<Result<TvCollectionEntity, HikkiApiException>> getWatchlistTv({int page = 1}) =>
      _personalRemoteDatasource.getWatchlistTv(page: page);
}
