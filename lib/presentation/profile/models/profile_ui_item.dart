import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_ui_item.freezed.dart';

@freezed
abstract class ProfileUiItem with _$ProfileUiItem {
  factory ProfileUiItem({
    required String name,
    required String userName,
    required String avatarPath,
  }) = _ProfileUiItem;
}
