import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/data/model/index.dart';

class AnimeMapper {
  List<AnimeEntity> mapAnimeList(dynamic data) =>
      AnimeApi.fromJson(data).data.map(_mapAnimeItem).toList();

  AnimeEntity _mapAnimeItem(Data data) => AnimeEntity(
        id: data.node.id,
        title: data.node.title,
        type: data.node.mediaType,
        score: data.node.mean ?? 0,
        imageUrl: data.node.mainPicture['large'] ?? "",
      );

  AnimeDetailsEntity mapAnimeDetails(dynamic data) {
    final animeDetailsResponse = AnimeDetailsResponse.fromJson(data);

    return AnimeDetailsEntity(
      id: animeDetailsResponse.id,
      title: animeDetailsResponse.title,
      type: animeDetailsResponse.mediaType,
      score: animeDetailsResponse.mean ?? 0.0,
      imageUrl: animeDetailsResponse.mainPicture['large'] ?? "",
      startDate: animeDetailsResponse.startDate ?? "",
      endDate: animeDetailsResponse.endDate ?? "",
      synopsis: animeDetailsResponse.synopsis,
      rank: animeDetailsResponse.rank ?? 0,
      popularity: animeDetailsResponse.popularity,
      numListUsers: animeDetailsResponse.numListUsers,
      numScoringUsers: animeDetailsResponse.numScoringUsers,
      createdAt: animeDetailsResponse.createdAt,
      updatedAt: animeDetailsResponse.updatedAt,
      mediaType: MediaTypeAnimeEntity.fromType(animeDetailsResponse.mediaType),
      status: StatusAnimeEntity.fromStatus(animeDetailsResponse.status),
      genres: animeDetailsResponse.genres.map(_mapGenre).toList(),
      numEpisodes: animeDetailsResponse.numEpisodes,
      rating: AgeRatingAnimeEntity.fromRating(animeDetailsResponse.rating),
      source: animeDetailsResponse.source,
      averageEpisodeDuration: animeDetailsResponse.averageEpisodeDuration,
      studios: animeDetailsResponse.studios.map(_mapStudio).toList(),
      screenshots: animeDetailsResponse.pictures.map(_mapScreenshots).toList(),
      relatedAnime: animeDetailsResponse.relatedAnime.map(_mapRelated).toList(),
      recommendations:
          animeDetailsResponse.recommendations.map(_mapRecommendation).toList(),
      stats: _mapStats(animeDetailsResponse.statistics),
    );
  }

  GenreEntity _mapGenre(Genres item) =>
      GenreEntity(id: item.id, name: item.name);

  StudioEntity _mapStudio(Studios item) =>
      StudioEntity(id: item.id, name: item.name);

  String _mapScreenshots(Map<String, String> item) => item['large'] ?? "";

  RelatedAnimeEntity _mapRelated(RelatedAnime item) => RelatedAnimeEntity(
        id: item.node.id,
        title: item.node.title,
        imageUrl: item.node.mainPicture['large'] ?? "",
        relationType: item.relationType,
        relationTypeFormatted: item.relationTypeFormatted,
      );

  RecommendationEntity _mapRecommendation(Recommendations item) =>
      RecommendationEntity(
        id: item.node.id,
        title: item.node.title,
        imageUrl: item.node.mainPicture['large'] ?? "",
        numRecommendations: item.numRecommendations,
      );

  StatsEntity _mapStats(Statistics statistics) => StatsEntity(
        numListUsers: statistics.numListUsers,
        watching: int.parse(statistics.status["watching"].toString()),
        completed: int.parse(statistics.status["completed"].toString()),
        onHold: int.parse(statistics.status["on_hold"].toString()),
        dropped: int.parse(statistics.status["dropped"].toString()),
        planToWatch: int.parse(statistics.status["plan_to_watch"].toString()),
      );
}
