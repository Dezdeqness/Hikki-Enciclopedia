import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/providers/api_providers.dart';
import 'package:hikki_enciclopedia/data/datasource/profile_datasource.dart';
import 'package:hikki_enciclopedia/data/mapper/index.dart';
import 'package:hikki_enciclopedia/data/providers/providers.dart';
import 'package:hikki_enciclopedia/data/repository/profile/profile_repository_impl.dart';
import 'package:hikki_enciclopedia/domain/repository/profile/profile_repository.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/providers/auth_providers.dart';
import 'package:hikki_enciclopedia/presentation/profile/mappers/profile_ui_model_mapper.dart';
import 'package:hikki_enciclopedia/presentation/profile/models/profile_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/profile/profile_notifier.dart';

final profileMapperProvider = Provider<ProfileMapper>((ref) {
  return ProfileMapper();
});

final profileDataSourceProvider = Provider<ProfileDataSource>((ref) {
  return ProfileDataSource(
    ref.watch(tmdbServiceProvider),
    ref.watch(dioErrorMapperProvider),
    ref.watch(profileMapperProvider),
  );
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final profileDataSource = ref.watch(profileDataSourceProvider);
  final authLocalDataSource = ref.watch(authLocalDataSourceProvider);
  return ProfileRepositoryImpl(profileDataSource, authLocalDataSource);
});

final profileUiMapperProvider = Provider<ProfileUiMapper>((ref) => ProfileUiMapper());

final profileNotifierProvider =
AsyncNotifierProvider<ProfileNotifier, ProfileUiItem>(() {
  return ProfileNotifier();
});
