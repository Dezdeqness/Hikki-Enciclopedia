import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/details/mapper/cast_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/details/mapper/season_ui_mapper.dart';

final seasonUiMapperProvider =
    Provider<SeasonUiMapper>((ref) => SeasonUiMapper());
final castUiMapperMapperProvider =
    Provider<CastUiMapper>((ref) => CastUiMapper());
