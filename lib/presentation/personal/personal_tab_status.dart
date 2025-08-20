import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_api_service/hikki_api_service.dart';

part 'personal_tab_status.freezed.dart';

@freezed
sealed class PersonalTabStatus with _$PersonalTabStatus {
  const factory PersonalTabStatus.initial() = Initial;
  const factory PersonalTabStatus.loading() = Loading;
  const factory PersonalTabStatus.loaded() = Loaded;
  const factory PersonalTabStatus.error(HikkiApiException error) = Error;
}
