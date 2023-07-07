import 'package:equatable/equatable.dart';

class RelatedAnimeUiModel extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final String relationType;

  const RelatedAnimeUiModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.relationType,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        relationType,
      ];
}
