import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/presentation/details/models/cast_ui_item.dart';

class CastUiMapper {
  CastUiItem toUiModel(CastEntity item) =>
      CastUiItem(
          name: item.character,
          originalName: item.name,
          profilePath: item.profilePath,
      );
}
