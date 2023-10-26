import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

part 'promo_state.freezed.dart';

@freezed
class PromoState with _$PromoState {
  factory PromoState({
    @Default([]) List<PromotionalEntity> items,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
  }) = _PromoState;
}
