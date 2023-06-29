import 'package:dio/dio.dart';
import 'package:hikki_enciclopedia/data/mapper/dio_error_mapper.dart';
import 'package:hikki_enciclopedia/domain/model/error_entity.dart';

class ErrorMapper {
  final DioErrorMapper _mapper;

  ErrorMapper(this._mapper);

  ErrorEntity mapException(Exception exception) {
    if (exception is DioError) {
      return _mapper.mapDioError(exception);
    }
    return ErrorEntity.unknown;
  }
}
