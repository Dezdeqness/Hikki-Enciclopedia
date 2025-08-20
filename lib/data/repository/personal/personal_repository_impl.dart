import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/index.dart';
import 'package:hikki_enciclopedia/data/datasource/personal_remote_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/profile_local_datasource.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/repository/personal/personal_repository.dart';
import 'package:result_type/result_type.dart';

class PersonalRepositoryImpl implements PersonalRepository {
  final PersonalRemoteDatasource _personalRemoteDatasource;
  final ProfileLocalDataSource _profileLocalDataSource;
  final AuthLocalDatasource _authLocalDatasource;

  PersonalRepositoryImpl(
    this._personalRemoteDatasource,
    this._profileLocalDataSource,
    this._authLocalDatasource,
  );

  @override
  Future<Result<MovieCollectionEntity, HikkiApiException>> getRatedMovies(
      {int page = 1}) async {
    final accountId = await _profileLocalDataSource.getProfileId() ?? "";
    final sessionId = await _authLocalDatasource.getSessionId() ?? "";
    return _personalRemoteDatasource.getRatedMovies(
      page: page,
      accountId: accountId,
      sessionId: sessionId,
    );
  }

  @override
  Future<Result<TvCollectionEntity, HikkiApiException>> getRatedTv(
      {int page = 1}) async {
    final accountId = await _profileLocalDataSource.getProfileId() ?? "";
    final sessionId = await _authLocalDatasource.getSessionId() ?? "";
    return _personalRemoteDatasource.getRatedTv(
      page: page,
      accountId: accountId,
      sessionId: sessionId,
    );
  }

  @override
  Future<Result<MovieCollectionEntity, HikkiApiException>> getWatchlistMovies(
      {int page = 1}) async {
    final accountId = await _profileLocalDataSource.getProfileId() ?? "";
    final sessionId = await _authLocalDatasource.getSessionId() ?? "";
    return _personalRemoteDatasource.getWatchlistMovies(
      page: page,
      accountId: accountId,
      sessionId: sessionId,
    );
  }

  @override
  Future<Result<TvCollectionEntity, HikkiApiException>> getWatchlistTv(
      {int page = 1}) async {
    final accountId = await _profileLocalDataSource.getProfileId() ?? "";
    final sessionId = await _authLocalDatasource.getSessionId() ?? "";
    return _personalRemoteDatasource.getWatchlistTv(
      page: page,
      accountId: accountId,
      sessionId: sessionId,
    );
  }
}
