import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_entity.freezed.dart';

@freezed
class NewsEntity with _$NewsEntity {
  factory NewsEntity({
    required String title,
    required String description,
    required String imageUrl,
    required String url,
  }) = _NewsEntity;
}
