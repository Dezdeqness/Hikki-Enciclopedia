import 'package:shared_preferences/shared_preferences.dart';

const _tokenKey = 'auth_token';

class AuthLocalDatasource {
  final SharedPreferences _prefs;

  AuthLocalDatasource(this._prefs);

  Future<String?> getSessionId() async {
    return _prefs.getString(_tokenKey);
  }

  Future<void> setSessionId(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  Future<void> clearSessionId() async {
    await _prefs.remove(_tokenKey);
  }
}
