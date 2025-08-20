import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/repository/auth/auth_repository.dart';
import 'package:hikki_enciclopedia/domain/repository/profile/profile_repository.dart';
import 'package:result_type/result_type.dart';

class AuthorizeUseCase {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  AuthorizeUseCase(this._authRepository, this._profileRepository);

  Future<Result<bool, HikkiApiException>> execute(String requestToken) async {
    final sessionIdResult = await _authRepository.getSessionIdRemote(requestToken);

    if (sessionIdResult.isFailure) {
      return Failure(sessionIdResult.failure);
    }

    final profileResult = await _profileRepository.getProfile();

    if (profileResult.isFailure) {
      return Failure(sessionIdResult.failure);
    }

    final sessionId = sessionIdResult.success;
    _authRepository.saveSessionId(sessionId);

    final profileId = profileResult.success.id;
    _profileRepository.saveProfileId(profileId.toString());

    return Success(true);
  }
}
