import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/home/providers/home_providers.dart';
import 'package:hikki_enciclopedia/presentation/details/mapper/cast_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/details/mapper/season_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/details/mapper/tv_details_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/details/models/tv_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/tv_details_notifier.dart';

final seasonUiMapperProvider =
    Provider<SeasonUiMapper>((ref) => SeasonUiMapper());
final castUiMapperMapperProvider =
    Provider<CastUiMapper>((ref) => CastUiMapper());

final tvDetailsUiMapperProvider =
    Provider<TvDetailsUiMapper>((ref) => TvDetailsUiMapper(
          ref.watch(seasonUiMapperProvider),
          ref.watch(castUiMapperMapperProvider),
          ref.watch(tvUiMapperProvider),
        ));

final tvDetailsNotifierProvider = AutoDisposeAsyncNotifierProviderFamily<
    TvDetailsNotifier, TvDetailsUiItem, String>(TvDetailsNotifier.new);
