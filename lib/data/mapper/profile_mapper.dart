import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

class ProfileMapper {
  ProfileEntity toEntity(ProfileResponse profile) => ProfileEntity(
    id: profile.id,
    name: profile.name,
    includeAdult: profile.includeAdult,
    username: profile.username,
    avatar: TMDBConstants.baseMediaUrl +
        TMDBConstants.mediaPath +
        (profile.avatar.tmdb.avatarPath ?? ""),
  );
}
