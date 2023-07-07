import 'package:equatable/equatable.dart';

class RecommendAnimeUiModel extends Equatable {
  final int id;
  final String title;
  final String imageUrl;

  const RecommendAnimeUiModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
      ];
}
