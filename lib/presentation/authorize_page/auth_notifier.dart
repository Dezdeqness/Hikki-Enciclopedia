import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/core/providers/api_providers.dart';
import 'package:hikki_enciclopedia/domain/authorize_use_case.dart';
import 'package:hikki_enciclopedia/domain/repository/auth/auth_repository.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/providers/auth_providers.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final AuthRepository _authRepository;
  late final AuthorizeUseCase _authorizeUseCase;

  @override
  AuthState build() {
    _authRepository = ref.watch(authRepositoryProvider);
    _authorizeUseCase = ref.watch(authorizeUseCaseProvider);
    return const AuthState(isLoading: false);
  }

  Future<void> onAuthorizeClicked() async {
    state = state.copyWith(isLoading: true);

    try {
      final resultToken = await _authRepository.getRequestToken();

      final token = resultToken.success;

      final redirectUri = ref.read(redirectUriProvider);

      final uri =
          Uri.https(TMDBConstants.oauthUrl, TMDBConstants.oauthPath + token, {
        TMDBConstants.redirectTo: redirectUri,
      });
      ref.read(authEventProvider.notifier).send(OpenUrlEvent(uri));
    } catch (e, _) {
      state = state.copyWith(isLoading: false);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> onAuthTokenReceived(Uri uri) async {
    final token = uri.queryParameters['request_token'];
    if (token == null || token.isEmpty) return;

    state = state.copyWith(isLoading: true);
    await _authorizeUseCase.execute(token);

    state = state.copyWith(isLoading: false);

    ref.read(authEventProvider.notifier).send(NavigateToMainFlow());
  }
}
