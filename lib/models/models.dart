//https://youtu.be/Mn254cnduOY?t=9042

import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginHandle {
  final String token;

  const LoginHandle({
    required this.token,
  });
//https://youtu.be/Mn254cnduOY?t=9280
  const LoginHandle.fooBar() : token = 'foobar';

//https://twitter.com/vandadnp/status/1507227536404754442
  @override
  bool operator ==(covariant LoginHandle other) => token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() => 'LoginHandle (token=$token)';
}

enum LoginErrors {
  invalidHandle,
}

@immutable
class Note {
  final String title;

  const Note({
    required this.title,
  });

  @override
  String toString() => 'Note (title=$title)';
}

//https://youtu.be/Mn254cnduOY?t=9560
//This will auto generate Note 1, Note 2, Note 3

final mockNotes = Iterable.generate(
  3,
  (i) => Note(title: 'Note ${i + 1}'),
);
