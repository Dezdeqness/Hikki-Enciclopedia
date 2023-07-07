import 'package:equatable/equatable.dart';

class RelatedAnimeEntity extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final String relationType;
  final String relationTypeFormatted;

  const RelatedAnimeEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.relationType,
    required this.relationTypeFormatted,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        relationType,
        relationTypeFormatted,
      ];
}
