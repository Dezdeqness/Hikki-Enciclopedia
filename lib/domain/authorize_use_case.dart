import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/repository/auth/auth_repository.dart';
import 'package:result_type/result_type.dart';

class AuthorizeUseCase {
  final AuthRepository _authRepository;

  AuthorizeUseCase(this._authRepository);

  Future<Result<bool, HikkiApiException>> execute(String requestToken) async {
    final sessionIdResult = await _authRepository.getSessionIdRemote(requestToken);

    if (sessionIdResult.isFailure) {
      return Failure(sessionIdResult.failure);
    }

    final sessionId = sessionIdResult.success;

    _authRepository.saveSessionId(sessionId);

    return Success(true);
  }
}
