import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  factory NewsState({
    @Default([]) List<NewsEntity> items,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
  }) = _NewsState;
}
