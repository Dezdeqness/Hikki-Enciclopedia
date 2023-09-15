import 'package:hikki_api_service/hikki_api_service.dart';

abstract class BaseApiDatasource {
  final ErrorMapper errorMapper;

  const BaseApiDatasource(this.errorMapper);
}
