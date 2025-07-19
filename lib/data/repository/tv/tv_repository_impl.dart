import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/tv_datasource.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/repository/tv/tv_repository.dart';
import 'package:result_type/result_type.dart';

class TvRepositoryImpl extends TvRepository {
  final TvDataSource _dataSource;

  TvRepositoryImpl(this._dataSource);

  @override
  Future<Result<TvCollectionEntity, HikkiApiException>> getTvAiringToday() =>
      _dataSource.getTvAiringToday();

  @override
  Future<Result<TvCollectionEntity, HikkiApiException>> getTvPopular() =>
      _dataSource.getTvPopular();

  @override
  Future<Result<TvCollectionEntity, HikkiApiException>> getTvTopRated() =>
      _dataSource.getTvTopRated();

  @override
  Future<Result<TvCollectionEntity, HikkiApiException>> getTvTrending() =>
      _dataSource.getTvTrending();
}
