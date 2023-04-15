class News {
  final String title;
  final String description;
  final String imageUrl;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class Promotional {
  final String name;
  final String kind;
  final String imageUrl;

  Promotional({
    required this.name,
    required this.kind,
    required this.imageUrl,
  });
}

class Anime {
  final String title;
  final String type;
  final double score;
  final String imageUrl;

  Anime({
    required this.title,
    required this.type,
    required this.score,
    required this.imageUrl,
  });
}
