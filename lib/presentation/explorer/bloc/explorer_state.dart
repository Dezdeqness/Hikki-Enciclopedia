import 'package:equatable/equatable.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';


final class ExplorerState extends Equatable {
  final RankingTypeEntity rankingType;
  final List<AnimeEntity> items;
  final bool isLoading;
  final bool isPageLoading;
  final bool isRefreshing;
  final String error;

  const ExplorerState({
    this.rankingType = RankingTypeEntity.all,
    this.items = const [],
    this.isLoading = false,
    this.isPageLoading = false,
    this.isRefreshing = false,
    this.error = "",
  });

  ExplorerState copyWith({
    RankingTypeEntity Function()? rankingType,
    List<AnimeEntity> Function()? items,
    bool Function()? isLoading,
    bool Function()? isPageLoading,
    bool Function()? isRefreshing,
    String Function()? error,
  }) {
    return ExplorerState(
      rankingType: rankingType != null ? rankingType() : this.rankingType,
      items: items != null ? items() : this.items,
      isLoading: isLoading != null ? isLoading() : this.isLoading,
      isPageLoading:
          isPageLoading != null ? isPageLoading() : this.isPageLoading,
      isRefreshing: isRefreshing != null ? isRefreshing() : this.isRefreshing,
      error: error != null ? error() : this.error,
    );
  }

  @override
  List<Object?> get props => [
        rankingType,
        items,
        isLoading,
        isPageLoading,
        isRefreshing,
        error,
      ];
}
