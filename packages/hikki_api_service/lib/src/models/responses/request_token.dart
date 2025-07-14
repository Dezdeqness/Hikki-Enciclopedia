import 'package:json_annotation/json_annotation.dart';

part 'request_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestToken {
  final bool success;
  final String expiresAt;
  final String requestToken;

  RequestToken({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  factory RequestToken.fromJson(Map<String, dynamic> json) => _$RequestTokenFromJson(json);
  Map<String, dynamic> toJson() => _$RequestTokenToJson(this);
}
