import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/genre_entity.dart';

class GenreMapper {
  GenreEntity toEntity(GenreResponse genre) => GenreEntity(
    id: genre.id,
    name: genre.name,
  );
}
