//https://youtu.be/Mn254cnduOY?t=10445

import 'package:flutter/foundation.dart' show immutable;
import 'package:login_bloc/models/models.dart';

@immutable
abstract class NotesApiProtocol {
  const NotesApiProtocol();
  //can return null due to the fact that they enter the wrong password
  Future<Iterable<Note>?> getNotes({
    required LoginHandle loginHandle,
  });
}

//https://youtu.be/Mn254cnduOY?t=10605
@immutable
class NotesApi implements NotesApiProtocol {
  @override
  Future<Iterable<Note>?> getNotes({
    required LoginHandle loginHandle,
  }) =>
      Future.delayed(
        const Duration(seconds: 2),
        () => loginHandle == const LoginHandle.fooBar() ? mockNotes : null,
      );
}
