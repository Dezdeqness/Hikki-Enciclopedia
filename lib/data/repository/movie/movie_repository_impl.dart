import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/index.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/domain/repository/index.dart';
import 'package:result_type/result_type.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<Result<MovieCollectionEntity, HikkiApiException>> getMovies({
    int page = 1,
    String sortBy = "popularity.desc",
  }) {
    return _dataSource.getMovies(page: page, sortBy: sortBy);
  }
}
