import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/presentation/tv_details/models/season_ui_item.dart';

class SeasonUiMapper {
  SeasonUiItem toUiModel(SeasonEntity item) =>
      SeasonUiItem(
        id: item.id,
        name: item.name,
        posterPath: item.posterPath,
      );
}
