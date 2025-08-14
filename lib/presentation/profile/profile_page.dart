import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/presentation/profile/components/profile_avatar_item.dart';
import 'package:hikki_enciclopedia/presentation/profile/models/profile_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/profile/providers/profile_providers.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: state.when(
            data: (data) => _body(data),
            error: (e, st) => ErrorScreen(error: e.toString()),
            loading: () => Center(child: CircularProgressIndicator())),
      ),
    );
  }

  Widget _body(ProfileUiItem item) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: ProfileAvatarItem(imageUrl: item.avatarPath),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              item.userName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              item.name,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
