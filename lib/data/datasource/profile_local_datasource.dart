import 'package:shared_preferences/shared_preferences.dart';

const _profileIdKey = 'profile_id';

class ProfileLocalDataSource {

  // TODO: make db
  final SharedPreferences _prefs;

  ProfileLocalDataSource(this._prefs);

  Future<String?> getProfileId() async {
    return _prefs.getString(_profileIdKey);
  }

  Future<void> setProfileId(String profileId) async {
    await _prefs.setString(_profileIdKey, profileId);
  }

  Future<void> clearProfileId() async {
    await _prefs.remove(_profileIdKey);
  }
}
