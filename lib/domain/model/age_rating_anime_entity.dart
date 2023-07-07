enum AgeRatingAnimeEntity {
  g(rating: "g",displayName: "G"),
  pg(rating: "pg",displayName: "PG"),
  pg13(rating: "pg_13",displayName: "PG-13"),
  r(rating: "r",displayName: "17+"),
  rPlus(rating: "r+",displayName: "R+"),
  rX(rating: "rx",displayName: "Rx"),
  unknown(rating: "",displayName: "");

  final String rating;
  final String displayName;

  const AgeRatingAnimeEntity({
    required this.rating,
    required this.displayName
  });

  static AgeRatingAnimeEntity fromRating(String rating) {
    for (var element in AgeRatingAnimeEntity.values) {
      if (element.rating == rating) {
        return element;
      }
    }
    return unknown;
  }
}
