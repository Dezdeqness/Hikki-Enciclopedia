import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/core/providers/api_providers.dart';
import 'package:hikki_enciclopedia/data/datasource/personal_remote_datasource.dart';
import 'package:hikki_enciclopedia/data/providers/providers.dart';
import 'package:hikki_enciclopedia/data/repository/personal/personal_repository_impl.dart';
import 'package:hikki_enciclopedia/domain/mapper/personal_mapper.dart';
import 'package:hikki_enciclopedia/domain/model/personal/personal_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/personal/personal_entity.dart';
import 'package:hikki_enciclopedia/domain/model/personal_list_type.dart';
import 'package:hikki_enciclopedia/domain/model/personal_page_type.dart';
import 'package:hikki_enciclopedia/domain/personal_rated_use_case.dart';
import 'package:hikki_enciclopedia/domain/personal_watched_use_case.dart';
import 'package:hikki_enciclopedia/domain/repository/personal/personal_repository.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/providers/auth_providers.dart';
import 'package:hikki_enciclopedia/presentation/explorer/providers/explorer_providers.dart';
import 'package:hikki_enciclopedia/presentation/home/providers/home_providers.dart';
import 'package:hikki_enciclopedia/presentation/personal/mapper/personal_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/personal/personal_tab_args.dart';
import 'package:hikki_enciclopedia/presentation/personal/personal_tab_notifier.dart';
import 'package:hikki_enciclopedia/presentation/personal/personal_tab_state.dart';
import 'package:hikki_enciclopedia/presentation/profile/providers/profile_providers.dart';
import 'package:result_type/result_type.dart';

final personalMapperProvider = Provider<PersonalMapper>((ref) {
  return PersonalMapper();
});

final personalRemoteDataSourceProvider =
    Provider<PersonalRemoteDatasource>((ref) {
  return PersonalRemoteDatasource(
    ref.watch(tmdbServiceProvider),
    ref.watch(dioErrorMapperProvider),
    ref.watch(tvMapperProvider),
    ref.watch(movieMapperProvider),
  );
});

final personalRepositoryProvider = Provider<PersonalRepository>((ref) {
  final personalRemoteDataSource = ref.watch(personalRemoteDataSourceProvider);
  final profileLocalDataSource = ref.watch(profileLocalSourceProvider);
  final authLocalDataSource = ref.watch(authLocalDataSourceProvider);
  return PersonalRepositoryImpl(personalRemoteDataSource, profileLocalDataSource, authLocalDataSource);
});

final personalUiMapperProvider =
    Provider<PersonalUiMapper>((ref) => PersonalUiMapper());

final personalWatchedUseCaseProvider = Provider<PersonalWatchedUseCase>((ref) {
  final repo = ref.read(personalRepositoryProvider);
  final mapper = ref.read(personalMapperProvider);
  return PersonalWatchedUseCase(repo, mapper);
});

final personalRatedUseCaseProvider = Provider<PersonalRatedUseCase>((ref) {
  final repo = ref.read(personalRepositoryProvider);
  final mapper = ref.read(personalMapperProvider);
  return PersonalRatedUseCase(repo, mapper);
});

final fetcherProvider = Provider.family<
    Future<Result<PersonalCollectionEntity, HikkiApiException>> Function(
        int, PersonalListType),
    PersonalPageType>((ref, type) {
  final rated = ref.read(personalRatedUseCaseProvider);
  final watched = ref.read(personalWatchedUseCaseProvider);
  switch (type) {
    case PersonalPageType.rated:
      return (page, listType) => rated.execute(listType, page);
    case PersonalPageType.watched:
      return (page, listType) => watched.execute(listType, page);
  }
});

final personalNotifierProvider = NotifierProvider.family<PersonalTabNotifier,
    PersonalTabState, PersonalTabArgs>(
  PersonalTabNotifier.new,
);
