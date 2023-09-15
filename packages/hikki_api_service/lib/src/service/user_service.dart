import 'package:dio/dio.dart';

class UserService {
  // TODO: DI
  final Dio _dio = Dio(
    // TODO: move to const
    BaseOptions(baseUrl: 'https://myanimelist.net/v1'),
  )..interceptors.addAll([
      InterceptorsWrapper(
        onRequest:
            (RequestOptions requestOptions, RequestInterceptorHandler handler) {
          requestOptions.headers.putIfAbsent(
              // TODO: setup env
              'X-MAL-CLIENT-ID',
              () => 'cafa1f4d6c21d80b3200dc3610970c22');
          handler.next(requestOptions);
        },
      ),
      LogInterceptor()
    ]);

  Future<Response> login(String code) async => await _dio.post(
        '/oauth2/token',
        data: {
          "code_verifier": 'Cl8SJKFwWtjvHN8S5usRLvp1DozffxklDdqW4ewLlD4',
          "code": code,
          "grant_type": 'authorization_code',
          "client_id": 'cafa1f4d6c21d80b3200dc3610970c22',
        },
        options: Options(contentType: "application/x-www-form-urlencoded"),
      );
}
