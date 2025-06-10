class HikkiApiException implements Exception {
  final ErrorEntity error;

  const HikkiApiException(this.error);

  static HikkiApiException unauthorized() => HikkiApiException(ErrorEntity.unauthorized);
  static HikkiApiException badRequest() => HikkiApiException(ErrorEntity.badRequest);
  static HikkiApiException forbidden() => HikkiApiException(ErrorEntity.forbidden);
  static HikkiApiException unknown() => HikkiApiException(ErrorEntity.unknown);
}

enum ErrorEntity { unauthorized, badRequest, forbidden, unknown }
