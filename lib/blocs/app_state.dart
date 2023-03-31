//https://youtu.be/Mn254cnduOY?t=10955
import 'package:flutter/foundation.dart' show immutable;
import 'package:login_bloc/models/models.dart';

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

@immutable
class AppState {
  final bool isLoading;

  //? indicates that it is optional
  final LoginErrors? loginError;
  final LoginHandle? loginHandle;
  final Iterable<Note>? fetchedNotes;

  const AppState.empty()
      : isLoading = false,
        loginError = null,
        loginHandle = null,
        fetchedNotes = null;

  const AppState({
    required this.isLoading,
    required this.loginError,
    required this.loginHandle,
    required this.fetchedNotes,
  });

//https://youtu.be/Mn254cnduOY?t=11200
  @override
  String toString() => {
        'isLoading': isLoading,
        'loginError': loginError,
        'loginHandle': loginHandle,
        'fetchedNotes': fetchedNotes
      }.toString();
}
