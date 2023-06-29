import 'package:dio/dio.dart';
import 'package:hikki_enciclopedia/domain/model/error_entity.dart';

class DioErrorMapper {
  ErrorEntity mapDioError(DioError error) {
    switch (error.response?.statusCode) {
      case 401:
        {
          return ErrorEntity.unauthorized;
        }
      case 403:
        {
          return ErrorEntity.forbidden;
        }
      case 400:
        return ErrorEntity.badRequest;
      default:
        return ErrorEntity.unknown;
    }
  }
}
