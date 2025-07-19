import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_collection_entity.dart';
import 'package:result_type/result_type.dart';

abstract class TvRepository {
  Future<Result<TvCollectionEntity, HikkiApiException>> getTvAiringToday();
  Future<Result<TvCollectionEntity, HikkiApiException>> getTvTrending();
  Future<Result<TvCollectionEntity, HikkiApiException>> getTvPopular();
  Future<Result<TvCollectionEntity, HikkiApiException>> getTvTopRated();
}
