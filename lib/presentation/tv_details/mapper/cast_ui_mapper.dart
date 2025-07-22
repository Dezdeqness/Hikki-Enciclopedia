import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/presentation/tv_details/models/cast_ui_item.dart';

class CastUiMapper {
  CastUiItem toUiModel(CastEntity item) =>
      CastUiItem(
          name: item.name,
          originalName: item.originalName,
          profilePath: item.profilePath,
      );
}
