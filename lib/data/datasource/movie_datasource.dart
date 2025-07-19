import 'package:dio/dio.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/mapper/index.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:result_type/result_type.dart';

class MovieDataSource {
  final TmdbService _service;
  final DioErrorMapper _errorMapper;
  final MovieMapper _movieMapper;

  MovieDataSource(this._service, this._errorMapper, this._movieMapper);

  Future<Result<MovieCollectionEntity, HikkiApiException>> getMovies(
      {int page = 1, String sortBy = "popularity.desc"}) async {
    try {
      final response = await _service.getMovies(page: page, sortBy: sortBy);

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
