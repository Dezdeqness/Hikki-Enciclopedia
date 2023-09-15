import 'package:dio/dio.dart';

import 'dio_error_mapper.dart';
import 'error_entity.dart';

class ErrorMapper {
  final DioErrorMapper _dioErrorMapper;

  ErrorMapper(this._dioErrorMapper);

  ErrorEntity mapException(Exception exception) {
    if (exception is DioException) {
      return _dioErrorMapper.mapDioError(exception);
    }
    return ErrorEntity.unknown;
  }
}
