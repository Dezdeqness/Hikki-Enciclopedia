import 'package:equatable/equatable.dart';

class Promotional extends Equatable {
  final String name;
  final String kind;
  final String imageUrl;

  const Promotional({
    required this.name,
    required this.kind,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        kind,
        imageUrl,
      ];
}
