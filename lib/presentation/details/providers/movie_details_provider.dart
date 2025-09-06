import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/details/mapper/movie_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/models/movie_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/core/details_providers.dart';
import 'package:hikki_enciclopedia/presentation/details/movie/movie_details_notifier.dart';
import 'package:hikki_enciclopedia/presentation/explorer/providers/explorer_providers.dart';

final movieDetailsUiMapperProvider =
Provider<MovieDetailsUiMapper>((ref) => MovieDetailsUiMapper(
  ref.watch(castUiMapperMapperProvider),
  ref.watch(movieUiMapperProvider),
));

final movieDetailsNotifierProvider = AutoDisposeAsyncNotifierProviderFamily<
    MovieDetailsNotifier, MovieDetailsUiItem, String>(MovieDetailsNotifier.new);
