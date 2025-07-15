import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/auth_local_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/auth_remote_datasource.dart';
import 'package:hikki_enciclopedia/domain/repository/auth/auth_repository.dart';
import 'package:result_type/result_type.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDatasource _localDatasource;
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl(this._localDatasource, this._remoteDatasource);

  @override
  Future<bool> isAuthorized() =>
      getSessionId().then((value) => value != null);

  @override
  Future<void> saveSessionId(String sessionId) =>
      _localDatasource.setSessionId(sessionId);

  @override
  Future<void> clearSessionId() => _localDatasource.clearSessionId();

  @override
  Future<String?> getSessionId() => _localDatasource.getSessionId();

  @override
  Future<Result<String, HikkiApiException>> getRequestToken() =>
      _remoteDatasource.getRequestToken();

  @override
  Future<Result<String, HikkiApiException>> getSessionIdRemote(String requestToken) =>
      _remoteDatasource.getSessionId(requestToken);
}
