import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:result_type/result_type.dart';

abstract class AuthRepository {
  Future<bool> isAuthorized();
  Future<void> saveSessionId(String sessionId);
  Future<void> clearSessionId();
  Future<String?> getSessionId();

  Future<Result<String, HikkiApiException>> getRequestToken();
}
