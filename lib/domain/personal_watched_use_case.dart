import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/mapper/personal_mapper.dart';
import 'package:hikki_enciclopedia/domain/model/personal/personal_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/personal_list_type.dart';
import 'package:result_type/result_type.dart';

import 'repository/personal/personal_repository.dart';

class PersonalWatchedUseCase {
  final PersonalRepository _personalRepository;
  final PersonalMapper _personalMapper;

  PersonalWatchedUseCase(this._personalRepository, this._personalMapper);

  Future<Result<PersonalCollectionEntity, HikkiApiException>> execute(
      PersonalListType type,
      int page,
      ) async {
    if (type == PersonalListType.movie) {
      final result = await _personalRepository.getWatchlistMovies(page: page);

      if (result.isFailure) {
        return Failure(result.failure);
      }

      final collection = result.success;
      final items = result.success.items
          .map((item) => _personalMapper.toPersonalEntityFromMovie(item))
          .toList();

      return Success(PersonalCollectionEntity(
          page: collection.page,
          items: items,
          totalPages: collection.totalPages));
    } else {
      final result = await _personalRepository.getWatchlistTv(page: page);

      if (result.isFailure) {
        return Failure(result.failure);
      }

      final collection = result.success;
      final items = result.success.items
          .map((item) => _personalMapper.toPersonalEntityFromTv(item))
          .toList();

      return Success(PersonalCollectionEntity(
          page: collection.page,
          items: items,
          totalPages: collection.totalPages));
    }
  }
}
