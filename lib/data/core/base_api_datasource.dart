import 'package:hikki_enciclopedia/data/mapper/error_mapper.dart';

abstract class BaseApiDatasource {
  final ErrorMapper errorMapper;

  const BaseApiDatasource(this.errorMapper);
}
