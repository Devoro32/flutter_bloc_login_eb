//https://youtu.be/Mn254cnduOY?t=10655
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AppAction {
  const AppAction();
}

@immutable
class LoginAction implements AppAction {
  final String email;
  final String password;

  const LoginAction({
    required this.email,
    required this.password,
  });
}

//https://youtu.be/Mn254cnduOY?t=10900
@immutable
class LoadNotesAction implements AppAction {
  const LoadNotesAction();
}
