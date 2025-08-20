import 'package:dio/dio.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/mapper/movie_mapper.dart';
import 'package:hikki_enciclopedia/data/mapper/tv_mapper.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_collection_entity.dart';
import 'package:result_type/result_type.dart';

class PersonalRemoteDatasource {
  final TmdbService _service;
  final DioErrorMapper _errorMapper;
  final TvMapper _tvMapper;
  final MovieMapper _movieMapper;

  PersonalRemoteDatasource(
      this._service, this._errorMapper, this._tvMapper, this._movieMapper);

  Future<Result<TvCollectionEntity, HikkiApiException>> getRatedTv(
      {int page = 1, required String accountId, required String sessionId}) async {
    try {
      final response = await _service.getRatedTv(
        page: page,
        accountId: accountId,
        sessionId: sessionId,
      );

      return Success(TvCollectionEntity(
        items:
            response.results.map((item) => _tvMapper.toEntity(item)).toList(),
        totalPages: response.totalPages,
        page: response.page,
      ));
    } on DioException catch (e) {
      return Failure(_errorMapper.mapDioError(e));
    } catch (e) {
      return Failure(HikkiApiException.unknown());
    }
  }

  Future<Result<MovieCollectionEntity, HikkiApiException>> getRatedMovies(
      {int page = 1, required String accountId, required String sessionId}) async {
    try {
      final response = await _service.getRatedMovies(
        page: page,
        accountId: accountId,
        sessionId: sessionId,
      );

      return Success(MovieCollectionEntity(
        items: response.results
            .map((item) => _movieMapper.toEntity(item))
            .toList(),
        totalPages: response.totalPages,
        page: response.page,
      ));
    } on DioException catch (e) {
      return Failure(_errorMapper.mapDioError(e));
    } catch (e) {
      return Failure(HikkiApiException.unknown());
    }
  }

  Future<Result<TvCollectionEntity, HikkiApiException>> getWatchlistTv(
      {int page = 1, required String accountId, required String sessionId}) async {
    try {
      final response = await _service.getWatchlistTv(
        page: page,
        accountId: accountId,
        sessionId: sessionId,
      );

      return Success(TvCollectionEntity(
        items:
            response.results.map((item) => _tvMapper.toEntity(item)).toList(),
        totalPages: response.totalPages,
        page: response.page,
      ));
    } on DioException catch (e) {
      return Failure(_errorMapper.mapDioError(e));
    } catch (e) {
      return Failure(HikkiApiException.unknown());
    }
  }

  Future<Result<MovieCollectionEntity, HikkiApiException>> getWatchlistMovies(
      {int page = 1, required String accountId, required String sessionId}) async {
    try {
      final response = await _service.getWatchlistMovies(
        page: page,
        accountId: accountId,
        sessionId: sessionId,
      );

      return Success(MovieCollectionEntity(
        items: response.results
            .map((item) => _movieMapper.toEntity(item))
            .toList(),
        totalPages: response.totalPages,
        page: response.page,
      ));
    } on DioException catch (e) {
      return Failure(_errorMapper.mapDioError(e));
    } catch (e) {
      return Failure(HikkiApiException.unknown());
    }
  }
}
