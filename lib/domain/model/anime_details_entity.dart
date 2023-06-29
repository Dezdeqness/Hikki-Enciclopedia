import 'package:equatable/equatable.dart';

class AnimeDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String type;
  final double score;
  final String imageUrl;

  const AnimeDetailsEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.score,
    required this.imageUrl,
  });

  @override
  String toString() =>
      'AnimeDetailsEntity{id: $id, title: $title, type: $type, score: $score, imageUrl: $imageUrl}';

  @override
  List<Object?> get props => [
        id,
        title,
        type,
        score,
        imageUrl,
      ];
}
