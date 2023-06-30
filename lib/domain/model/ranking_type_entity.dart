enum RankingTypeEntity {
  all(id: "all"),
  airing(id: "airing"),
  upcoming(id: "upcoming"),
  movie(id: "movie"),
  special(id: "special"),
  byPopularity(id: "bypopularity"),
  favourite(id: "favorite");

  final String id;

  const RankingTypeEntity({
    required this.id,
  });

  static RankingTypeEntity fromId(String id) {
    for (var element in RankingTypeEntity.values) {
      if (element.id == id) {
        return element;
      }
    }
    return all;
  }
}
