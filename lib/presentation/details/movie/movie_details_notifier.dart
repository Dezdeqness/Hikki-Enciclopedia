import 'package:hikki_enciclopedia/domain/repository/movie/movie_repository.dart';
import 'package:hikki_enciclopedia/presentation/details/core/base_details_notifier.dart';
import 'package:hikki_enciclopedia/presentation/details/mapper/movie_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/models/movie_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/providers/movie_details_provider.dart';
import 'package:hikki_enciclopedia/presentation/explorer/providers/explorer_providers.dart';

class MovieDetailsNotifier extends BaseDetailsNotifier<MovieDetailsUiItem> {
  late MovieRepository _movieRepository;
  late MovieDetailsUiMapper _movieDetailsUiMapper;

  @override
  Future<MovieDetailsUiItem> load(String id) async {
    _movieRepository = ref.watch(movieRepositoryProvider);
    _movieDetailsUiMapper = ref.watch(movieDetailsUiMapperProvider);

    final result = await _movieRepository.getMovieDetails(id);
    if (result.isSuccess) {
      return _movieDetailsUiMapper.toUiItem(result.success);
    }
    throw result.failure;
  }
}