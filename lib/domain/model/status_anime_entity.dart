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
}
