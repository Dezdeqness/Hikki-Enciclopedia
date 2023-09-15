import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/anime/anime_api_datasource.dart';
import 'package:hikki_enciclopedia/domain/model/anime_details_entity.dart';
import 'package:hikki_enciclopedia/domain/model/anime_entity.dart';
import 'package:hikki_enciclopedia/domain/repository/anime_repository.dart';
import 'package:result_type/result_type.dart';

class AnimeRepositoryImpl extends AnimeRepository {
  final AnimeApiDataSource dataSource;

  AnimeRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Result<AnimeDetailsEntity, ErrorEntity>> getAnimeDetails({
    required int animeId,
  }) =>
      dataSource.getAnimeDetails(animeId: animeId);

  @override
  Future<Result<List<AnimeEntity>, ErrorEntity>> getAnimeListByRanking({
    required String rankingType,
    required int offset,
  }) =>
      dataSource.getAnimeList(
        rankingType: rankingType,
        offset: offset,
      );
}
