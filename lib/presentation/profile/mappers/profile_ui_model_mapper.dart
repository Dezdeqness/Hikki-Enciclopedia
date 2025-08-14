import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/presentation/profile/models/profile_ui_item.dart';

class ProfileUiMapper {
  ProfileUiItem toUiItem(ProfileEntity item) => ProfileUiItem(
        name: item.name,
        userName: item.username,
        avatarPath: item.avatar,
      );
}
