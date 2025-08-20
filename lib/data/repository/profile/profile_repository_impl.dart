import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/auth_local_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/profile_remote_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/profile_local_datasource.dart';
import 'package:hikki_enciclopedia/domain/model/profile_entity.dart';
import 'package:hikki_enciclopedia/domain/repository/profile/profile_repository.dart';
import 'package:result_type/result_type.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ProfileLocalDataSource _profileLocalDataSource;
  final AuthLocalDatasource _localDatasource;

  ProfileRepositoryImpl(this._profileRemoteDataSource, this._profileLocalDataSource, this._localDatasource);

  @override
  Future<Result<ProfileEntity, HikkiApiException>> getProfile() async {
    final sessionId = await _localDatasource.getSessionId();
    if (sessionId == null) {
      throw HikkiApiException.unauthorized();
    }
    return _profileRemoteDataSource.getProfile(sessionId);
  }

  @override
  Future<void> clearProfileId() async {
    _profileLocalDataSource.clearProfileId();
  }

  @override
  Future<String?> getProfileId() => _profileLocalDataSource.getProfileId();

  @override
  Future<void> saveProfileId(String profileId) async {
    _profileLocalDataSource.setProfileId(profileId);
  }
}
