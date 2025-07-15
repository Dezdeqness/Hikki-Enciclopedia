import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/auth_event.dart';


class AppEventNotifier extends StateNotifier<AuthEvent?> {
  AppEventNotifier() : super(null);

  void send(AuthEvent event) {
    state = event;
    Future.microtask(() => state = null);
  }
}
