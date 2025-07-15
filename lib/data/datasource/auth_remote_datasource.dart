import 'package:dio/dio.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:result_type/result_type.dart';

class AuthRemoteDatasource {
  final MovieService _service;
  final DioErrorMapper _errorMapper;

  AuthRemoteDatasource(this._service, this._errorMapper);

  Future<Result<String, HikkiApiException>> getRequestToken() async {
    try {
      final response = await _service.getRequestToken();

      if (!response.success) return Failure(HikkiApiException.unknown());

      return Success(response.requestToken);
    } on DioException catch (e) {
      return Failure(_errorMapper.mapDioError(e));
    } catch (e) {
      return Failure(HikkiApiException.unknown());
    }
  }

  Future<Result<String, HikkiApiException>> getSessionId(String requestToken) async {
    try {
      final body = RequestTokenRequest(requestToken: requestToken);
      final response = await _service.getSessionToken(body);

      if (!response.success) return Failure(HikkiApiException.unknown());

      return Success(response.sessionId);
    } on DioException catch (e) {
      return Failure(_errorMapper.mapDioError(e));
    } catch (e) {
      return Failure(HikkiApiException.unknown());
    }
  }
}
