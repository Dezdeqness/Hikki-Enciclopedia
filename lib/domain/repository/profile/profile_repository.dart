import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:result_type/result_type.dart';

abstract class ProfileRepository {
  Future<Result<ProfileEntity, HikkiApiException>> getProfile();
  Future<void> saveProfileId(String profileId);
  Future<void> clearProfileId();
  Future<String?> getProfileId();
}
