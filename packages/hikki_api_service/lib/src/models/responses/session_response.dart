import 'package:json_annotation/json_annotation.dart';

part 'session_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SessionResponse {
  final bool success;
  final String sessionId;

  SessionResponse({
    required this.success,
    required this.sessionId,
  });

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SessionResponseToJson(this);
}
