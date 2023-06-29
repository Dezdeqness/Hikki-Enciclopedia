import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String description;
  final String imageUrl;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        imageUrl,
      ];
}
