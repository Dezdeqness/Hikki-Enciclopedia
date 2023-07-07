import 'package:equatable/equatable.dart';

class BriefInfoAnimeUIModel extends Equatable {
  final String title;
  final String value;

  const BriefInfoAnimeUIModel({
    required this.title,
    required this.value,
  });

  @override
  List<Object?> get props => [title, value];
}
