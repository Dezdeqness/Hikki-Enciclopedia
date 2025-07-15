

sealed class AuthEvent {
  const AuthEvent();
}

class OpenUrlEvent extends AuthEvent {
  final Uri uri;

  const OpenUrlEvent(this.uri);
}

class NavigateToMainFlow extends AuthEvent {
  const NavigateToMainFlow();
}
