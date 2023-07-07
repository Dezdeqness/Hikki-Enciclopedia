import 'package:equatable/equatable.dart';
import 'package:hikki_enciclopedia/domain/model/age_rating_anime_entity.dart';
import 'package:hikki_enciclopedia/domain/model/media_type_anime_entity.dart';
import 'package:hikki_enciclopedia/domain/model/recommendation_entity.dart';
import 'package:hikki_enciclopedia/domain/model/related_anime_entity.dart';
import 'package:hikki_enciclopedia/domain/model/stats_entity.dart';
import 'package:hikki_enciclopedia/domain/model/status_anime_entity.dart';
import 'package:hikki_enciclopedia/domain/model/studio_entity.dart';

import 'genre_entity.dart';

class AnimeDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String type;
  final double score;
  final String imageUrl;
  final String startDate;
  final String endDate;
  final String synopsis;
  final int rank;
  final int popularity;
  final int numListUsers;
  final int numScoringUsers;
  final String createdAt;
  final String updatedAt;
  final MediaTypeAnimeEntity mediaType;
  final StatusAnimeEntity status;
  final List<GenreEntity> genres;
  final int numEpisodes;
  final AgeRatingAnimeEntity rating;
  final String source;
  final int averageEpisodeDuration;
  final List<StudioEntity> studios;
  final List<String> screenshots;
  final List<RelatedAnimeEntity> relatedAnime;
  final List<RecommendationEntity> recommendations;
  final StatsEntity stats;

  const AnimeDetailsEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.score,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.synopsis,
    required this.rank,
    required this.popularity,
    required this.numListUsers,
    required this.numScoringUsers,
    required this.createdAt,
    required this.updatedAt,
    required this.mediaType,
    required this.status,
    required this.genres,
    required this.numEpisodes,
    required this.rating,
    required this.source,
    required this.averageEpisodeDuration,
    required this.studios,
    required this.screenshots,
    required this.relatedAnime,
    required this.recommendations,
    required this.stats,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        type,
        score,
        imageUrl,
        startDate,
        endDate,
        synopsis,
        rank,
        popularity,
        numListUsers,
        numScoringUsers,
        createdAt,
        updatedAt,
        mediaType,
        status,
        genres,
        numEpisodes,
        rating,
        source,
        averageEpisodeDuration,
        studios,
        screenshots,
        relatedAnime,
        recommendations,
        stats,
      ];

  @override
  String toString() => title;
}
