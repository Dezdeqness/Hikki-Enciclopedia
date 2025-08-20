import 'package:hikki_enciclopedia/domain/model/personal/personal_entity.dart';
import 'package:hikki_enciclopedia/presentation/personal/models/personal_ui_item.dart';

class PersonalUiMapper {

  PersonalUiItem fromEntity(PersonalEntity item) =>
      PersonalUiItem(
        id: item.id,
        name: item.title,
        overview: item.overview,
        posterPath: item.posterPath,
        rating: item.rating,
        voteAverage: (item.voteAverage * 10).floor(),
      );
}
