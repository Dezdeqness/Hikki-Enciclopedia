import 'dart:async';
import 'package:hikki_enciclopedia/domain/repository/tv/tv_repository.dart';
import 'package:hikki_enciclopedia/presentation/details/core/base_details_notifier.dart';
import 'package:hikki_enciclopedia/presentation/home/providers/home_providers.dart';
import 'package:hikki_enciclopedia/presentation/details/mapper/tv_details_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/details/models/tv_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/providers/tv_details_providers.dart';

class TvDetailsNotifier extends BaseDetailsNotifier<TvDetailsUiItem> {
  late TvRepository _tvRepository;
  late TvDetailsUiMapper _tvDetailsUiMapper;

  @override
  Future<TvDetailsUiItem> load(String id) async {
    _tvRepository = ref.watch(tvRepositoryProvider);
    _tvDetailsUiMapper = ref.watch(tvDetailsUiMapperProvider);

    final result = await _tvRepository.getTvDetails(id);
    if (result.isSuccess) {
      return _tvDetailsUiMapper.toUiItem(result.success);
    }
    throw result.failure;
  }
}
