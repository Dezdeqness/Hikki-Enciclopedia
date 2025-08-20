import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/providers/api_providers.dart';
import 'package:hikki_enciclopedia/data/datasource/auth_local_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/auth_remote_datasource.dart';
import 'package:hikki_enciclopedia/data/providers/providers.dart';
import 'package:hikki_enciclopedia/data/repository/auth/auth_repository_impl.dart';
import 'package:hikki_enciclopedia/domain/authorize_use_case.dart';
import 'package:hikki_enciclopedia/domain/repository/auth/auth_repository.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/auth_event.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/auth_event_notifier.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/auth_notifier.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/auth_state.dart';
import 'package:hikki_enciclopedia/presentation/profile/providers/profile_providers.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDatasource>((ref) {
  return AuthLocalDatasource(
    ref.watch(sharedPreferencesProvider),
  );
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasource(
    ref.watch(tmdbServiceProvider),
    ref.watch(dioErrorMapperProvider),
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.watch(authLocalDataSourceProvider),
    ref.watch(authRemoteDataSourceProvider),
  );
});

final authEventProvider =
    StateNotifierProvider<AppEventNotifier, AuthEvent?>((ref) {
  return AppEventNotifier();
});

final authNotifierProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

final authorizeUseCaseProvider = Provider<AuthorizeUseCase>((ref) {
  return AuthorizeUseCase(ref.watch(authRepositoryProvider), ref.watch(profileRepositoryProvider));
});
