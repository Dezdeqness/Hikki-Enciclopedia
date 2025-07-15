import 'package:json_annotation/json_annotation.dart';

part 'request_token_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestTokenRequest {
  final String requestToken;

  RequestTokenRequest({
    required this.requestToken,
  });

  factory RequestTokenRequest.fromJson(Map<String, dynamic> json) => _$RequestTokenRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RequestTokenRequestToJson(this);
}
