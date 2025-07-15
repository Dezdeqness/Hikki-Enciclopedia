import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/domain/repository/auth/auth_repository.dart';
import 'package:hikki_enciclopedia/presentation/entry_page/app_auth_state.dart';

class AppAuthStateNotifier extends StateNotifier<AppAuthState> {
  final AuthRepository _authRepository;

  AppAuthStateNotifier(this._authRepository) : super(const AppAuthState.initial());

  Future<void> checkAuth() async {
    final isAuthorized = await _authRepository.isAuthorized();
    state = isAuthorized ? AppAuthState.loggedIn() : AppAuthState.loggedOut();
  }

}
