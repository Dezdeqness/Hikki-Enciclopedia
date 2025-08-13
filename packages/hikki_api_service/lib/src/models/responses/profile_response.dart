import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileResponse {
  final int id;
  final String name;
  final bool includeAdult;
  final String username;
  final Avatar avatar;

  ProfileResponse({
    required this.id,
    required this.name,
    required this.includeAdult,
    required this.username,
    required this.avatar,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class Avatar {
  final Gravatar gravatar;
  final Tmdb tmdb;

  Avatar({
    required this.gravatar,
    required this.tmdb,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) =>
      _$AvatarFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}

@JsonSerializable()
class Gravatar {
  final String hash;

  Gravatar({required this.hash});

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
  Map<String, dynamic> toJson() => _$GravatarToJson(this);
}

@JsonSerializable()
class Tmdb {
  final String? avatarPath;

  Tmdb({this.avatarPath});

  factory Tmdb.fromJson(Map<String, dynamic> json) =>
      _$TmdbFromJson(json);
  Map<String, dynamic> toJson() => _$TmdbToJson(this);
}