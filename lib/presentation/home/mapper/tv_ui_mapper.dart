import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_entity.dart';
import 'package:hikki_enciclopedia/presentation/explorer/models/movie_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/home/models/tv_ui_item.dart';
import 'package:hikki_localization/hikki_localization.dart';

class TvUiMapper {
  final _dateFormat = DateFormat('yyyy/MM/dd');

  TvUiItem toUiModel(TvEntity item) =>
      TvUiItem(
        id: item.id,
        name: item.name,
        overview: item.overview,
        voteAverage: (item.voteAverage * 10).floor(),
        firstAirDate: item.firstAirDate != null
            ? _dateFormat.format(item.firstAirDate!)
            : "",
        posterPath: item.posterPath,
        popularity: item.popularity,
      );
}
