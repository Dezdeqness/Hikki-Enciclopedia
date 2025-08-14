import 'package:dio/dio.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/mapper/profile_mapper.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:result_type/result_type.dart';

class ProfileDataSource {
  final TmdbService _service;
  final DioErrorMapper _errorMapper;
  final ProfileMapper _profileMapper;

  ProfileDataSource(this._service, this._errorMapper, this._profileMapper);

  Future<Result<ProfileEntity, HikkiApiException>> getProfile(String sessionId) async {
    try {
      final response = await _service.getProfile(sessionId: sessionId);

      return Success(_profileMapper.toEntity(response));
    } on DioException catch (e) {
      return Failure(_errorMapper.mapDioError(e));
    } catch (e) {
      return Failure(HikkiApiException.unknown());
    }
  }
}
