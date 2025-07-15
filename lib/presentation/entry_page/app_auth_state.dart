import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_auth_state.freezed.dart';

@freezed
sealed class AppAuthState with _$AppAuthState {
  const factory AppAuthState.initial() = Initial;
  const factory AppAuthState.loggedIn() = LoggedIn;
  const factory AppAuthState.loggedOut() = LoggedOut;
}
