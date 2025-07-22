import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/cast_entity.dart';

class CastMapper {
  CastEntity toEntity(Cast cast) => CastEntity(
        id: cast.id,
        name: cast.name,
        originalName: cast.originalName,
        popularity: cast.popularity,
        profilePath: cast.profilePath != null
            ? TMDBConstants.baseImageUrl +
                TMDBConstants.imagePath +
                cast.profilePath!
            : "",
        knownForDepartment: cast.knownForDepartment,
        gender: cast.gender,
        character: cast.character,
        creditId: cast.creditId,
        order: cast.order,
      );
}
