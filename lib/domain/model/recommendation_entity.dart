import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final int numRecommendations;

  const RecommendationEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.numRecommendations,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        numRecommendations,
      ];
}
