import 'package:hikki_localization/hikki_localization.dart';

enum StatusAnimeEntity {
  finished(status: "finished_airing"),
  airing(status: "currently_airing"),
  notStarted(status: "not_yet_aired"),
  unknown(status: "unknown");

  final String status;

  const StatusAnimeEntity({
    required this.status,
  });

  static StatusAnimeEntity fromStatus(String status) {
    for (var element in StatusAnimeEntity.values) {
      if (element.status == status) {
        return element;
      }
    }
    return unknown;
  }

  static String getDisplayNameKey(StatusAnimeEntity item) {
    switch (item) {
      case StatusAnimeEntity.airing:
        return LocaleKeys.animeDetailTypeAiring;
      case StatusAnimeEntity.finished:
        return LocaleKeys.animeDetailTypeFinished;
      case StatusAnimeEntity.notStarted:
        return LocaleKeys.animeDetailTypeNotStartedYet;
      default:
        return '';
    }
  }
}
