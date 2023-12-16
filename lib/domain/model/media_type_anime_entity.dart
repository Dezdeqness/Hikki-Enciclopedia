import 'package:hikki_localization/hikki_localization.dart';

enum MediaTypeAnimeEntity {
  tv(type: "tv"),
  ova(type: "ova"),
  movie(type: "movie"),
  ona(type: "ona"),
  music(type: "music"),
  unknown(type: "unknown");

  final String type;

  const MediaTypeAnimeEntity({
    required this.type,
  });

  static MediaTypeAnimeEntity fromType(String type) {
    for (var element in MediaTypeAnimeEntity.values) {
      if (element.type == type) {
        return element;
      }
    }
    return unknown;
  }

  static String getDisplayNameKey(MediaTypeAnimeEntity item) {
    switch (item) {
      case MediaTypeAnimeEntity.movie:
        return LocaleKeys.animeDetailTypeMovie;
      case MediaTypeAnimeEntity.tv:
        return LocaleKeys.animeDetailTypeTv;
      case MediaTypeAnimeEntity.ona:
        return LocaleKeys.animeDetailTypeOna;
      case MediaTypeAnimeEntity.ova:
        return LocaleKeys.animeDetailTypeOva;
      case MediaTypeAnimeEntity.music:
        return LocaleKeys.animeDetailTypeMusic;
      default:
        return "";
    }
  }
}
