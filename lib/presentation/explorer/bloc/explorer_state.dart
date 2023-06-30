import 'package:equatable/equatable.dart';
import 'package:hikki_enciclopedia/domain/model/ranking_type_entity.dart';

import '../../../domain/model/anime_entity.dart';

final class ExplorerState extends Equatable {
  final RankingTypeEntity rankingType;
  final List<AnimeEntity> items;
  final bool isLoading;
  final String error;

  const ExplorerState({
    this.rankingType = RankingTypeEntity.all,
    this.items = const [],
    this.isLoading = false,
    this.error = "",
  });

  ExplorerState copyWith({
    RankingTypeEntity Function()? rankingType,
    List<AnimeEntity> Function()? items,
    bool Function()? isLoading,
    String Function()? error,
  }) {
    return ExplorerState(
      rankingType: rankingType != null ? rankingType() : this.rankingType,
      items: items != null ? items() : this.items,
      isLoading: isLoading != null ? isLoading() : this.isLoading,
      error: error != null ? error() : this.error,
    );
  }

  @override
  List<Object?> get props => [
        rankingType,
        items,
        isLoading,
        error,
      ];
}
