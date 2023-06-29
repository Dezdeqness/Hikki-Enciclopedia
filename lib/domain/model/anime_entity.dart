import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final int id;
  final String title;
  final String type;
  final double score;
  final String imageUrl;

  const AnimeEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.score,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        type,
        score,
        imageUrl,
      ];
}
