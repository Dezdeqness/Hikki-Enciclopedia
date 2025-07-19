import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/utils/result_type_utils.dart';
import 'package:hikki_enciclopedia/domain/repository/tv/tv_repository.dart';
import 'package:hikki_enciclopedia/presentation/home/providers/home_providers.dart';

import 'home_section_state.dart';
import 'mapper/tv_ui_mapper.dart';
import 'models/tv_section_type.dart';

class HomeNotifier extends Notifier<HomeSectionState> {
  late final TvRepository _repo;
  late final TvUiMapper _tvUiMapper;
  final TvSectionType _type;

  HomeNotifier(this._type);

  @override
  HomeSectionState build() {
    _repo = ref.read(tvRepositoryProvider);
    _tvUiMapper = ref.read(tvUiMapperProvider);
    load();
    return const HomeSectionState.initial();
  }

  Future<void> load() async {
    state = const HomeSectionState.loading();

    final result = switch (_type) {
      TvSectionType.airingToday => await _repo.getTvAiringToday(),
      TvSectionType.popular => await _repo.getTvPopular(),
      TvSectionType.topRated => await _repo.getTvTopRated(),
      TvSectionType.trending => await _repo.getTvTrending(),
    };

    state = result.when(
      success: (data) => HomeSectionState.success(
          tvs: data.items.map((item) => _tvUiMapper.toUiModel(item)).toList()),
      failure: (error) => HomeSectionState.error(error),
    );
  }
}
