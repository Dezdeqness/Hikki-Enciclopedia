import 'package:equatable/equatable.dart';

class StatisticsAnimeUiModel extends Equatable {
  final String title;
  final String value;
  final double progress;

  const StatisticsAnimeUiModel({
    required this.title,
    required this.value,
    required this.progress,
  });

  @override
  List<Object?> get props => [
        title,
        value,
        progress,
      ];
}
