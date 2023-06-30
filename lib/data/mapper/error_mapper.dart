import 'package:dio/dio.dart';
import 'package:hikki_enciclopedia/data/mapper/dio_error_mapper.dart';
import 'package:hikki_enciclopedia/domain/model/error_entity.dart';

class ErrorMapper {
  final DioErrorMapper _dioErrorMapper;

  ErrorMapper(this._dioErrorMapper);

  ErrorEntity mapException(Exception exception) {
    if (exception is DioError) {
      return _dioErrorMapper.mapDioError(exception);
    }
    return ErrorEntity.unknown;
  }
}
