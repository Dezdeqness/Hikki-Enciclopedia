import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/presentation/explorer/models/movie_ui_item.dart';
import 'package:hikki_localization/hikki_localization.dart';

class MovieUiMapper {
  final _dateFormat = DateFormat('yyyy/MM/dd');

  MovieUiItem toUiModel(MovieEntity item) =>
      MovieUiItem(
        id: item.id,
        title: item.title,
        overview: item.overview,
        voteAverage: (item.voteAverage * 10).floor(),
        releaseDate: item.releaseDate != null
            ? _dateFormat.format(item.releaseDate!)
            : "",
        posterPath: item.posterPath,
        popularity: item.popularity,
      );
}
