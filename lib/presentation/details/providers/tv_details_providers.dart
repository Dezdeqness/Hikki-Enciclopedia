import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/details/core/details_providers.dart';
import 'package:hikki_enciclopedia/presentation/home/providers/home_providers.dart';
import 'package:hikki_enciclopedia/presentation/details/mapper/tv_details_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/details/models/tv_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/tv/tv_details_notifier.dart';

final tvDetailsUiMapperProvider =
    Provider<TvDetailsUiMapper>((ref) => TvDetailsUiMapper(
          ref.watch(seasonUiMapperProvider),
          ref.watch(castUiMapperMapperProvider),
          ref.watch(tvUiMapperProvider),
        ));

final tvDetailsNotifierProvider = AutoDisposeAsyncNotifierProviderFamily<
    TvDetailsNotifier, TvDetailsUiItem, String>(TvDetailsNotifier.new);
