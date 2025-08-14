import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/domain/repository/profile/profile_repository.dart';
import 'package:hikki_enciclopedia/presentation/profile/mappers/profile_ui_model_mapper.dart';
import 'package:hikki_enciclopedia/presentation/profile/models/profile_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/profile/providers/profile_providers.dart';

class ProfileNotifier extends AsyncNotifier<ProfileUiItem> {
  late ProfileRepository _profileRepository;
  late ProfileUiMapper _profileUiMapper;

  @override
  Future<ProfileUiItem> build() async {
    _profileRepository = ref.watch(profileRepositoryProvider);
    _profileUiMapper = ref.watch(profileUiMapperProvider);

    state = const AsyncLoading();

    final result = await _profileRepository.getProfile();

    if (result.isSuccess) {
      return _profileUiMapper.toUiItem(result.success);
    }

    throw result.failure;
  }
}
