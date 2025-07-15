import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/providers/auth_providers.dart';
import 'package:hikki_enciclopedia/presentation/entry_page/app_auth_state.dart';
import 'package:hikki_enciclopedia/presentation/entry_page/app_auth_state_notifier.dart';

final appAuthStateNotifierProvider =
    StateNotifierProvider<AppAuthStateNotifier, AppAuthState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AppAuthStateNotifier(repo);
});
