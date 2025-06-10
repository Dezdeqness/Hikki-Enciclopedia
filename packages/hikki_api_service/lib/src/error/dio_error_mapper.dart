import 'package:dio/dio.dart';

import 'error_entity.dart';


class DioErrorMapper {
  HikkiApiException mapDioError(DioException error) {
    switch (error.response?.statusCode) {
      case 401:
        {
          return HikkiApiException.unauthorized();
        }
      case 403:
        {
          return HikkiApiException.forbidden();
        }
      case 400:
        return HikkiApiException.badRequest();
      default:
        return HikkiApiException.unknown();
    }
  }
}
