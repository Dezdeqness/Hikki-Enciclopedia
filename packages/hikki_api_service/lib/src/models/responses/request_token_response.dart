import 'package:json_annotation/json_annotation.dart';

part 'request_token_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestTokenResponse {
  final bool success;
  final String expiresAt;
  final String requestToken;

  RequestTokenResponse({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  factory RequestTokenResponse.fromJson(Map<String, dynamic> json) => _$RequestTokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RequestTokenResponseToJson(this);
}
