import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/data/repository/anime_repository_impl.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_details_use_case.dart';
import 'package:hikki_enciclopedia/main.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/composer/anime_details_composer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anime_details_dependencies.g.dart';

@riverpod
GetAnimeDetailsUseCase getAnimeDetailsUseCase(Ref ref) {
  var repository = getIt<AnimeRepositoryImpl>();
  return GetAnimeDetailsUseCase(animeRepository: repository);
}

@riverpod
AnimeDetailsComposer animeDetailsComposer(Ref ref) {
  return AnimeDetailsComposer();
}
