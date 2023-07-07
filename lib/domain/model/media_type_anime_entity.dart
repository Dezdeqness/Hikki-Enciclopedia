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
}
