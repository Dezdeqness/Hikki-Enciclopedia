import 'package:equatable/equatable.dart';

class PromotionalEntity extends Equatable {
  final String name;
  final String kind;
  final String imageUrl;
  final String url;

  const PromotionalEntity({
    required this.name,
    required this.kind,
    required this.imageUrl,
    required this.url,
  });

  @override
  List<Object?> get props => [
        name,
        kind,
        imageUrl,
        url,
      ];
}
