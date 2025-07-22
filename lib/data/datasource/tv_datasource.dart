import 'package:dio/dio.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/mapper/tv_mapper.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_details_entity.dart';
import 'package:result_type/result_type.dart';

class TvDataSource {
  final TmdbService _service;
  final DioErrorMapper _errorMapper;
  final TvMapper _tvMapper;

  TvDataSource(this._service, this._errorMapper, this._tvMapper);

  Future<Result<TvCollectionEntity, HikkiApiException>> getTvPopular(
      {int page = 1}) async {
    try {
      final response = await _service.getTvPopular(page: page);

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

  Future<Result<TvCollectionEntity, HikkiApiException>> getTvAiringToday(
      {int page = 1}) async {
    try {
      final response = await _service.getTvAiringToday(page: page);

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

  Future<Result<TvCollectionEntity, HikkiApiException>> getTvTopRated(
      {int page = 1}) async {
    try {
      final response = await _service.getTvTopRated(page: page);

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

  Future<Result<TvCollectionEntity, HikkiApiException>> getTvTrending(
      {int page = 1}) async {
    try {
      final response = await _service.getTvTrending(page: page);

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

  Future<Result<TvDetailsEntity, HikkiApiException>> getTvDetails(
    String seriesId,
  ) async {
    try {
      final response = await _service.getTvDetails(seriesId: seriesId);

      return Success(_tvMapper.toDetailsEntity(response));
    } on DioException catch (e) {
      return Failure(_errorMapper.mapDioError(e));
    } catch (e) {
      return Failure(HikkiApiException.unknown());
    }
  }
}
